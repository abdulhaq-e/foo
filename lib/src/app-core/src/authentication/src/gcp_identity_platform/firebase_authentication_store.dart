import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'dependencies.dart';
import 'domain/domain.dart';

class FirebaseAuthenticationStore implements AuthenticationStore {
  FirebaseAuthenticationStore({
    required AuthenticationStore authenticationStore,
  }) : _authenticationStore = authenticationStore {
    // Listen to both our auth store and Firebase auth changes
    _authStoreSubscription = _authenticationStore.authenticationStateStream.listen(
      (authResponse) => _onAuthStateChange(),
    );

    _firebaseAuthSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (firebaseUser) => _onAuthStateChange(),
    );
  }

  final AuthenticationStore _authenticationStore;
  final _controller = StreamController<AuthenticationResponse?>.broadcast();

  late StreamSubscription<AuthenticationResponse?> _authStoreSubscription;
  late StreamSubscription<User?> _firebaseAuthSubscription;

  void _onAuthStateChange() async {
    final authResponse = await getCurrentAuthenticationData();
    _controller.add(authResponse);
  }

  @override
  Future<AuthenticationResponse?> getCurrentAuthenticationData() async {
    // First check our authentication store
    final authResponse = await _authenticationStore.getCurrentAuthenticationData();

    // Then check Firebase current user
    final firebaseUser = FirebaseAuth.instance.currentUser;

    // Only return authResponse if both conditions are met:
    // 1. We have an authentication response stored
    // 2. Firebase has a current user
    if (authResponse != null && firebaseUser != null) {
      return authResponse;
    }

    // If either is missing, we're not authenticated
    return null;
  }

  @override
  Stream<AuthenticationResponse?> get authenticationStateStream async* {
    // Emit initial state
    final initialAuth = await getCurrentAuthenticationData();
    yield initialAuth;

    // Then emit stream changes
    yield* _controller.stream;
  }

  @override
  Future<void> saveAuthenticationData(AuthenticationResponse response) async {
    await _authenticationStore.saveAuthenticationData(response);
    // The auth state change will be triggered by the subscription
  }

  @override
  Future<void> clearAuthentication() async {
    await _authenticationStore.clearAuthentication();

    // Also sign out from Firebase if there's a current user
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      try {
        await FirebaseAuth.instance.signOut();
      } catch (e) {
        // Log error but don't throw - we still want to clear our local auth
        print('Warning: Failed to sign out from Firebase: $e');
      }
    }

    // The auth state change will be triggered by the subscriptions
  }

  void dispose() {
    _authStoreSubscription.cancel();
    _firebaseAuthSubscription.cancel();
    _controller.close();
  }
}
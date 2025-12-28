import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foo/authentication.dart';
import 'package:foo/testing.dart';

void main() {
  group('AuthenticationInteractor', () {
    late FakeAuthenticationService authService;
    late FakeAuthenticationStore authStore;
    late AuthenticationInteractor interactor;

    setUp(() {
      authService = FakeAuthenticationService();
      authStore = FakeAuthenticationStore();
    });

    tearDown(() {
      interactor.dispose();
      authService.dispose();
      authStore.dispose();
    });

    group('Initial State', () {
      test('yields unauthenticated when no cached data exists', () async {
        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [AuthenticationStatus.unauthenticated]);
        expect(interactor.token, isNull);
        expect(interactor.saasTenantEntityId, isNull);
        expect(interactor.additionalData, isNull);

        await subscription.cancel();
      });

      test('yields authenticated when cached data exists', () async {
        const cachedResponse = AuthenticationResponse(
          token: 'cached-token',
          saasTenantEntityId: 'cached-tenant',
          additionalData: {'source': 'cache'},
        );

        await authStore.saveAuthenticationData(cachedResponse);

        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [AuthenticationStatus.authenticated]);
        expect(interactor.token, 'cached-token');
        expect(interactor.saasTenantEntityId, 'cached-tenant');
        expect(interactor.additionalData, {'source': 'cache'});

        await subscription.cancel();
      });
    });

    group('Successful Authentication', () {
      test('updates state and saves to store on successful auth', () async {
        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        const authResponse = AuthenticationResponse(
          token: 'new-token',
          saasTenantEntityId: 'new-tenant',
          additionalData: {'role': 'admin'},
        );

        authService.emitSuccessfulAuth(authResponse);

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [
          AuthenticationStatus.unauthenticated,
          AuthenticationStatus.authenticated,
        ]);
        expect(interactor.token, 'new-token');
        expect(interactor.saasTenantEntityId, 'new-tenant');
        expect(interactor.additionalData, {'role': 'admin'});
        expect(authStore.saveCallCount, 1);
        expect(authStore.savedResponses.first, authResponse);

        await subscription.cancel();
      });
    });

    group('Failed Authentication', () {
      test('clears state and store on failed auth', () async {
        // Start with cached data
        const cachedResponse = AuthenticationResponse(
          token: 'old-token',
          saasTenantEntityId: 'old-tenant',
        );
        await authStore.saveAuthenticationData(cachedResponse);

        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        authService.emitFailedAuth('Invalid credentials');

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [
          AuthenticationStatus.authenticated,
          AuthenticationStatus.unauthenticated,
        ]);
        expect(interactor.token, isNull);
        expect(interactor.saasTenantEntityId, isNull);
        expect(interactor.additionalData, isNull);
        expect(authStore.clearCallCount, 1);

        await subscription.cancel();
      });
    });

    group('Logout', () {
      test('clears state, calls service and store', () async {
        const authResponse = AuthenticationResponse(
          token: 'token',
          saasTenantEntityId: 'tenant',
        );
        await authStore.saveAuthenticationData(authResponse);

        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        final initialClearCount = authStore.clearCallCount;

        await interactor.logout();

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [
          AuthenticationStatus.authenticated,
          AuthenticationStatus.unauthenticated,
        ]);
        expect(interactor.token, isNull);
        expect(interactor.saasTenantEntityId, isNull);
        expect(interactor.additionalData, isNull);
        expect(authStore.clearCallCount, initialClearCount + 1);

        await subscription.cancel();
      });
    });

    group('Refresh', () {
      test('updates state with refreshed token and saves to store', () async {
        const initialAuth = AuthenticationResponse(
          token: 'old-token',
          saasTenantEntityId: 'tenant',
          additionalData: {'role': 'user'},
        );
        await authStore.saveAuthenticationData(initialAuth);

        // Set up the service to return the initial auth
        authService.setAuthResponse(initialAuth);

        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        expect(interactor.token, 'old-token');

        final initialSaveCount = authStore.saveCallCount;

        // Update the service to return a refreshed token
        const refreshedAuth = AuthenticationResponse(
          token: 'refreshed-token',
          saasTenantEntityId: 'tenant',
          additionalData: {'role': 'user'},
        );
        authService.setAuthResponse(refreshedAuth);

        await interactor.refresh();

        await Future.delayed(Duration(milliseconds: 50));

        expect(states, [
          AuthenticationStatus.authenticated,
          AuthenticationStatus.authenticated, // Refresh updates state
        ]);
        expect(interactor.token, 'refreshed-token');
        expect(interactor.saasTenantEntityId, 'tenant');
        expect(interactor.additionalData, {'role': 'user'});
        expect(authStore.saveCallCount, initialSaveCount + 1);
        expect(authStore.savedResponses.last, refreshedAuth);

        await subscription.cancel();
      });

      test('equality guard prevents duplicate event on refresh', () async {
        const initialAuth = AuthenticationResponse(
          token: 'token-ABC',
          saasTenantEntityId: 'tenant-123',
        );
        await authStore.saveAuthenticationData(initialAuth);
        authService.setAuthResponse(initialAuth);

        interactor = AuthenticationInteractor(
          authenticationService: authService,
          authenticationStore: authStore,
        );

        final states = <AuthenticationStatus>[];
        final subscription = interactor.status.listen(states.add);

        await Future.delayed(Duration(milliseconds: 50));

        // Set up refresh to return updated token
        const refreshedAuth = AuthenticationResponse(
          token: 'token-XYZ',
          saasTenantEntityId: 'tenant-123',
        );
        authService.setAuthResponse(refreshedAuth);

        await interactor.refresh();

        await Future.delayed(Duration(milliseconds: 50));

        // After refresh:
        // 1. Interactor updates local state to token-XYZ
        // 2. Interactor saves to store
        // 3. Store emits token-XYZ back via authenticationStateStream
        // 4. Equality guard sees: incoming=XYZ, current=XYZ -> ignore
        expect(states, [
          AuthenticationStatus.authenticated,
          AuthenticationStatus.authenticated, // Only ONE authenticated event from refresh
        ]);

        expect(interactor.token, 'token-XYZ');

        await subscription.cancel();
      });
    });

    group('Equality Guard Edge Case', () {
      test(
        'does NOT re-emit state when store echoes back the same value',
        () async {
          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          const authResponse = AuthenticationResponse(
            token: 'token-ABC',
            saasTenantEntityId: 'tenant-123',
            additionalData: {'role': 'user'},
          );

          // Step 1: Service emits successful auth
          // This causes:
          // 1. Interactor updates local state to token-ABC
          // 2. Interactor saves to store
          // 3. Store emits token-ABC back via authenticationStateStream
          // 4. Equality guard sees: incoming=ABC, current=ABC -> ignore
          authService.emitSuccessfulAuth(authResponse);

          await Future.delayed(Duration(milliseconds: 50));

          // At this point:
          // - Interactor saved to store
          // - Store emitted the same value back (via authenticationStateStream)
          // - Equality guard should have prevented re-emission

          expect(states, [
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated, // Only ONE authenticated event
          ]);

          // Verify the interactor has the correct state
          expect(interactor.token, 'token-ABC');
          expect(interactor.saasTenantEntityId, 'tenant-123');
          expect(interactor.additionalData, {'role': 'user'});

          await subscription.cancel();
        },
      );

      test(
        'equality guard prevents duplicate event when store manually emits same authenticated value',
        () async {
          const authResponse = AuthenticationResponse(
            token: 'token-ABC',
            saasTenantEntityId: 'tenant-123',
          );
          await authStore.saveAuthenticationData(authResponse);

          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          // Interactor already has token-ABC in state
          expect(states, [AuthenticationStatus.authenticated]);

          // Store emits the SAME value again (simulating echo)
          authStore.emitAuthenticationChange(authResponse);

          await Future.delayed(Duration(milliseconds: 50));

          // Equality guard should prevent re-emission
          expect(states, [
            AuthenticationStatus.authenticated,
            // No duplicate event
          ]);

          expect(interactor.token, 'token-ABC');

          await subscription.cancel();
        },
      );

      test(
        'DOES re-emit state when store emits a different value (e.g., from another tab)',
        () async {
          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          const firstAuthResponse = AuthenticationResponse(
            token: 'token-ABC',
            saasTenantEntityId: 'tenant-123',
          );

          // User logs in via service
          authService.emitSuccessfulAuth(firstAuthResponse);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated,
          ]);

          const differentAuthResponse = AuthenticationResponse(
            token: 'token-XYZ', // Different token (e.g., from another tab)
            saasTenantEntityId: 'tenant-456',
          );

          // Simulate another tab updating the store
          authStore.emitAuthenticationChange(differentAuthResponse);

          await Future.delayed(Duration(milliseconds: 50));

          // Should emit authenticated again because the value is different
          expect(states, [
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated,
            AuthenticationStatus.authenticated, // New event for different value
          ]);

          expect(interactor.token, 'token-XYZ');
          expect(interactor.saasTenantEntityId, 'tenant-456');

          await subscription.cancel();
        },
      );

      test(
        'handles logout from another tab (store emits null)',
        () async {
          const authResponse = AuthenticationResponse(
            token: 'token-ABC',
            saasTenantEntityId: 'tenant-123',
          );
          await authStore.saveAuthenticationData(authResponse);

          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [AuthenticationStatus.authenticated]);
          expect(interactor.token, 'token-ABC');

          // Simulate another tab logging out
          authStore.emitAuthenticationChange(null);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [
            AuthenticationStatus.authenticated,
            AuthenticationStatus.unauthenticated, // Reacts to logout from another tab
          ]);

          expect(interactor.token, isNull);
          expect(interactor.saasTenantEntityId, isNull);

          await subscription.cancel();
        },
      );

      test(
        'does NOT re-emit unauthenticated when store echoes back null after logout',
        () async {
          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          // Manually trigger store to emit null (simulating echo without going through service)
          // This tests the equality guard directly
          authStore.emitAuthenticationChange(null);

          await Future.delayed(Duration(milliseconds: 50));

          // The equality guard should prevent re-emission because state is already null
          expect(states, [
            AuthenticationStatus.unauthenticated,
            // No second unauthenticated event because equality guard blocked it
          ]);

          expect(interactor.token, isNull);

          await subscription.cancel();
        },
      );
    });

    group('Cross-Tab Synchronization', () {
      test(
        'syncs authentication state when another tab authenticates',
        () async {
          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [AuthenticationStatus.unauthenticated]);

          const authResponse = AuthenticationResponse(
            token: 'tab2-token',
            saasTenantEntityId: 'tab2-tenant',
            additionalData: {'source': 'tab2'},
          );

          // Simulate authentication from another tab
          authStore.emitAuthenticationChange(authResponse);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated,
          ]);

          expect(interactor.token, 'tab2-token');
          expect(interactor.saasTenantEntityId, 'tab2-tenant');
          expect(interactor.additionalData, {'source': 'tab2'});

          await subscription.cancel();
        },
      );

      test(
        'updates to new token when another tab refreshes authentication',
        () async {
          const initialAuth = AuthenticationResponse(
            token: 'old-token',
            saasTenantEntityId: 'tenant',
          );
          await authStore.saveAuthenticationData(initialAuth);

          interactor = AuthenticationInteractor(
            authenticationService: authService,
            authenticationStore: authStore,
          );

          final states = <AuthenticationStatus>[];
          final subscription = interactor.status.listen(states.add);

          await Future.delayed(Duration(milliseconds: 50));

          expect(interactor.token, 'old-token');

          const refreshedAuth = AuthenticationResponse(
            token: 'refreshed-token',
            saasTenantEntityId: 'tenant',
          );

          // Simulate token refresh from another tab
          authStore.emitAuthenticationChange(refreshedAuth);

          await Future.delayed(Duration(milliseconds: 50));

          expect(states, [
            AuthenticationStatus.authenticated,
            AuthenticationStatus.authenticated, // New auth with refreshed token
          ]);

          expect(interactor.token, 'refreshed-token');
          expect(interactor.saasTenantEntityId, 'tenant');

          await subscription.cancel();
        },
      );
    });
  });
}

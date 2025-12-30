import 'package:foo/core.dart';

/// Session status representing the combined state of authentication + user data
enum SessionStatus {
  /// Initial state, checking storage for existing session
  unknown,

  /// Authenticated but still fetching user profile
  loading,

  /// Fully authenticated with user data loaded
  authenticated,

  /// Not authenticated
  unauthenticated,
}

/// Unified session state that includes both auth status and user data.
/// This ensures that when authenticated, we always have user data available.
class SessionState {
  final SessionStatus status;
  final User? user;
  final String? token;
  final String? saasTenantEntityId;
  final Object? additionalData;

  const SessionState({
    required this.status,
    this.user,
    this.token,
    this.saasTenantEntityId,
    this.additionalData,
  });

  /// True when we're done initializing and know the session state
  bool get isReady =>
      status != SessionStatus.unknown && status != SessionStatus.loading;

  /// True when authenticated AND have user data
  bool get isAuthenticated =>
      status == SessionStatus.authenticated && user != null;

  SessionState copyWith({
    SessionStatus? status,
    User? user,
    String? token,
    String? saasTenantEntityId,
    Object? additionalData,
  }) {
    return SessionState(
      status: status ?? this.status,
      user: user ?? this.user,
      token: token ?? this.token,
      saasTenantEntityId: saasTenantEntityId ?? this.saasTenantEntityId,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}

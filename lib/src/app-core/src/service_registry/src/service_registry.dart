/// Type-safe service registry for dependency injection
///
/// Provides a centralized registry for managing application-wide services
/// created during bootstrap. Uses Dart's type system for compile-time safety.
///
/// Example:
/// ```dart
/// final registry = ServiceRegistry();
///
/// // Register services
/// registry.register<AuthenticationInteractor>(authInteractor);
/// registry.register<APIClient>(apiClient);
///
/// // Retrieve services
/// final authInteractor = registry.get<AuthenticationInteractor>();
/// final apiClient = registry.get<APIClient>();
///
/// // Check if service exists
/// if (registry.has<SessionInteractor>()) {
///   final session = registry.get<SessionInteractor>();
/// }
/// ```
class ServiceRegistry {
  final Map<Type, dynamic> _services = {};

  /// Register a service instance with its type
  ///
  /// Throws [ArgumentError] if a service of this type is already registered
  ///
  /// Example:
  /// ```dart
  /// registry.register<AuthenticationInteractor>(authInteractor);
  /// ```
  void register<T>(T instance) {
    if (_services.containsKey(T)) {
      throw ArgumentError(
        'Service of type $T is already registered. '
        'Use replace() if you need to override an existing service.',
      );
    }
    _services[T] = instance;
  }

  /// Register a service instance, replacing any existing instance of the same type
  ///
  /// Use this when you need to override a previously registered service.
  /// For initial registration, prefer [register] which will throw if the service
  /// already exists.
  ///
  /// Example:
  /// ```dart
  /// registry.replace<AuthenticationInteractor>(newAuthInteractor);
  /// ```
  void replace<T>(T instance) {
    _services[T] = instance;
  }

  /// Retrieve a registered service by its type
  ///
  /// Throws [StateError] if the service is not registered
  ///
  /// Example:
  /// ```dart
  /// final authInteractor = registry.get<AuthenticationInteractor>();
  /// ```
  T get<T>() {
    final service = _services[T];
    if (service == null) {
      throw StateError(
        'Service of type $T is not registered. '
        'Make sure to register this service before attempting to retrieve it.',
      );
    }
    return service as T;
  }

  /// Try to retrieve a registered service by its type
  ///
  /// Returns null if the service is not registered
  ///
  /// Example:
  /// ```dart
  /// final authInteractor = registry.tryGet<AuthenticationInteractor>();
  /// if (authInteractor != null) {
  ///   // Use the service
  /// }
  /// ```
  T? tryGet<T>() {
    final service = _services[T];
    return service as T?;
  }

  /// Check if a service of the given type is registered
  ///
  /// Example:
  /// ```dart
  /// if (registry.has<SessionInteractor>()) {
  ///   // Service is available
  /// }
  /// ```
  bool has<T>() {
    return _services.containsKey(T);
  }

  /// Remove a service from the registry
  ///
  /// Returns true if the service was removed, false if it wasn't registered
  ///
  /// Example:
  /// ```dart
  /// registry.remove<AuthenticationInteractor>();
  /// ```
  bool remove<T>() {
    return _services.remove(T) != null;
  }

  /// Clear all registered services
  ///
  /// Use with caution - this removes all services from the registry
  void clear() {
    _services.clear();
  }

  /// Get the number of registered services
  int get count => _services.length;

  /// Get all registered service types
  ///
  /// Returns an unmodifiable list of all registered service types
  List<Type> get registeredTypes => List.unmodifiable(_services.keys);
}

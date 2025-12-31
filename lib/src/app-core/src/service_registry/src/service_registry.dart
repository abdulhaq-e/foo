/// Type-safe service registry for dependency injection
///
/// Provides a centralized registry for managing application-wide services
/// created during bootstrap. Uses Dart's type system for compile-time safety.
///
/// Supports multiple instances of the same type using optional names.
///
/// Example:
/// ```dart
/// final registry = ServiceRegistry();
///
/// // Register services
/// registry.register<AuthenticationInteractor>(authInteractor);
/// registry.register<APIClient>(apiClient);
///
/// // Register multiple instances of the same type with names
/// registry.register<DatabaseClient>(primaryDb, name: 'primary');
/// registry.register<DatabaseClient>(secondaryDb, name: 'secondary');
///
/// // Retrieve services
/// final authInteractor = registry.get<AuthenticationInteractor>();
/// final apiClient = registry.get<APIClient>();
/// final primaryDb = registry.get<DatabaseClient>(name: 'primary');
/// final secondaryDb = registry.get<DatabaseClient>(name: 'secondary');
///
/// // Check if service exists
/// if (registry.has<SessionInteractor>()) {
///   final session = registry.get<SessionInteractor>();
/// }
/// ```
class ServiceRegistry {
  final Map<(Type, Object?), dynamic> _services = {};

  /// Register a service instance with its type
  ///
  /// Optionally provide a [name] to register multiple instances of the same type.
  ///
  /// Throws [ArgumentError] if a service of this type (and name) is already registered
  ///
  /// Example:
  /// ```dart
  /// registry.register<AuthenticationInteractor>(authInteractor);
  /// registry.register<DatabaseClient>(primaryDb, name: 'primary');
  /// registry.register<DatabaseClient>(secondaryDb, name: 'secondary');
  /// ```
  void register<T>(T instance, {Object? name}) {
    final key = (T, name);
    if (_services.containsKey(key)) {
      throw ArgumentError(
        'Service of type $T${name != null ? " with name '$name'" : ""} is already registered. '
        'Use replace() if you need to override an existing service.',
      );
    }
    _services[key] = instance;
  }

  /// Register a service instance, replacing any existing instance of the same type
  ///
  /// Optionally provide a [name] to replace a specific named instance.
  ///
  /// Use this when you need to override a previously registered service.
  /// For initial registration, prefer [register] which will throw if the service
  /// already exists.
  ///
  /// Example:
  /// ```dart
  /// registry.replace<AuthenticationInteractor>(newAuthInteractor);
  /// registry.replace<DatabaseClient>(newPrimaryDb, name: 'primary');
  /// ```
  void replace<T>(T instance, {Object? name}) {
    _services[(T, name)] = instance;
  }

  /// Retrieve a registered service by its type
  ///
  /// Optionally provide a [name] to retrieve a specific named instance.
  ///
  /// Throws [StateError] if the service is not registered
  ///
  /// Example:
  /// ```dart
  /// final authInteractor = registry.get<AuthenticationInteractor>();
  /// final primaryDb = registry.get<DatabaseClient>(name: 'primary');
  /// ```
  T get<T>({Object? name}) {
    final key = (T, name);
    final service = _services[key];
    if (service == null) {
      throw StateError(
        'Service of type $T${name != null ? " with name '$name'" : ""} is not registered. '
        'Make sure to register this service before attempting to retrieve it.',
      );
    }
    return service as T;
  }

  /// Try to retrieve a registered service by its type
  ///
  /// Optionally provide a [name] to retrieve a specific named instance.
  ///
  /// Returns null if the service is not registered
  ///
  /// Example:
  /// ```dart
  /// final authInteractor = registry.tryGet<AuthenticationInteractor>();
  /// if (authInteractor != null) {
  ///   // Use the service
  /// }
  /// final primaryDb = registry.tryGet<DatabaseClient>(name: 'primary');
  /// ```
  T? tryGet<T>({Object? name}) {
    final service = _services[(T, name)];
    return service as T?;
  }

  /// Check if a service of the given type is registered
  ///
  /// Optionally provide a [name] to check for a specific named instance.
  ///
  /// Example:
  /// ```dart
  /// if (registry.has<SessionInteractor>()) {
  ///   // Service is available
  /// }
  /// if (registry.has<DatabaseClient>(name: 'primary')) {
  ///   // Named service is available
  /// }
  /// ```
  bool has<T>({Object? name}) {
    return _services.containsKey((T, name));
  }

  /// Remove a service from the registry
  ///
  /// Optionally provide a [name] to remove a specific named instance.
  ///
  /// Returns true if the service was removed, false if it wasn't registered
  ///
  /// Example:
  /// ```dart
  /// registry.remove<AuthenticationInteractor>();
  /// registry.remove<DatabaseClient>(name: 'primary');
  /// ```
  bool remove<T>({Object? name}) {
    return _services.remove((T, name)) != null;
  }

  /// Clear all registered services
  ///
  /// Use with caution - this removes all services from the registry
  void clear() {
    _services.clear();
  }

  /// Get the number of registered services
  int get count => _services.length;

  /// Get all registered service keys (type and name pairs)
  ///
  /// Returns an unmodifiable list of all registered service keys.
  /// Each key is a record of (Type, Object?) where the Object is the optional name.
  List<(Type, Object?)> get registeredKeys => List.unmodifiable(_services.keys);
}

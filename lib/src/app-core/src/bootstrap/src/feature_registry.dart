import 'feature_registration.dart';

/// Registry for managing feature registrations
///
/// This class maintains a collection of features and provides methods to
/// register them all at once during app bootstrap.
///
/// Type Parameters:
/// - [TContext]: The registration context type passed to features during registration
///
/// Example:
/// ```dart
/// final registry = FeatureRegistry<MyAppContext>();
/// registry.add(HomeFeature());
/// registry.add(ProfileFeature());
///
/// // During bootstrap
/// final context = MyAppContext(
///   navigationService: navService,
///   container: dependencies,
/// );
/// registry.registerAll(context);
/// ```
class FeatureRegistry<TContext> {
  final List<FeatureRegistration<TContext>> _features = [];

  /// Add a feature to the registry
  ///
  /// Throws [ArgumentError] if a feature with the same name is already registered
  void add(FeatureRegistration<TContext> feature) {
    if (_features.any((f) => f.name == feature.name)) {
      throw ArgumentError(
        "Feature '${feature.name}' is already registered",
      );
    }
    _features.add(feature);
  }

  /// Register all features with the given context
  ///
  /// Calls [FeatureRegistration.register] on each registered feature in the
  /// order they were added.
  ///
  /// [context] - The registration context to pass to each feature
  void registerAll(TContext context) {
    for (final feature in _features) {
      feature.register(context);
    }
  }

  /// Get all registered features
  ///
  /// Returns an unmodifiable list of all registered features
  List<FeatureRegistration<TContext>> getAll() {
    return List.unmodifiable(_features);
  }

  /// Get the number of registered features
  int get count => _features.length;

  /// Check if a feature with the given name is registered
  bool hasFeature(String name) {
    return _features.any((f) => f.name == name);
  }

  /// Remove all features from the registry
  void clear() {
    _features.clear();
  }
}

/// Interface for features that can self-register their dependencies
///
/// Features implementing this interface can encapsulate their registration logic,
/// making the app bootstrap process more declarative and maintainable.
///
/// Type Parameters:
/// - [TContext]: The registration context type that contains dependencies
///   needed during feature registration (e.g., navigation service, dependency container)
abstract class FeatureRegistration<TContext> {
  /// Unique identifier for this feature
  String get name;

  /// Register all dependencies for this feature
  ///
  /// This method is called during app bootstrap and should contain all
  /// registration logic for the feature (e.g., registering routes, services,
  /// providers, etc.)
  ///
  /// [context] - Registration context with shared dependencies
  void register(TContext context);
}

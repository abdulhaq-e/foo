/// Interface for providing SaaS tenant entity IDs.
///
/// Implement this abstract class to provide tenant IDs from various sources
/// such as secure storage, memory cache, or user session services.
abstract class SaasTenantEntityIdProvider {
  /// Returns the SaaS tenant entity ID.
  ///
  /// This method is called before each API request to retrieve the current
  /// tenant ID. Implementations should handle tenant ID retrieval and any
  /// errors that may occur.
  Future<String> getTenantId();
}

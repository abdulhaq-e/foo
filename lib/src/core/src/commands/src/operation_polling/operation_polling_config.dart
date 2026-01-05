/// Configuration for async operation polling behavior.
///
/// Controls how often the [OperationPollingService] checks the status endpoint
/// and how long it will wait before timing out.
class OperationPollingConfig {
  /// How often to poll the status endpoint.
  final Duration pollingInterval;

  /// Maximum time to wait for operation completion before timing out.
  final Duration timeout;

  const OperationPollingConfig({
    this.pollingInterval = const Duration(seconds: 2),
    this.timeout = const Duration(seconds: 30),
  });

  /// Default configuration with 2-second polling interval and 30-second timeout.
  static const defaultConfig = OperationPollingConfig();

  /// Create a configuration with a custom timeout (in seconds) while using
  /// the default polling interval.
  ///
  /// Useful for commands that specify their own timeout requirements.
  factory OperationPollingConfig.fromTimeout(int timeoutSeconds) {
    return OperationPollingConfig(
      timeout: Duration(seconds: timeoutSeconds),
    );
  }
}

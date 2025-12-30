import 'loader_interop_stub.dart'
    if (dart.library.js_interop) 'loader_interop_web.dart';

/// Platform-agnostic wrapper for LoaderInterop functionality
///
/// On web: calls the JavaScript loader
/// On other platforms: no-op implementations
class LoaderInterop {
  /// Updates the loading text displayed to the user
  static void updateText(String text) => updateLoaderText(text);

  /// Updates tenant branding information
  ///
  /// [tenantName] - Name of the tenant to display
  /// [primaryColor] - Hex color string (e.g., '#FF0000') for branding
  static void updateTenantInfo(String? tenantName, String? primaryColor) =>
      updateLoaderTenantInfo(tenantName, primaryColor);

  /// Shows an error message in the loader
  static void showError(String message) => showLoaderError(message);

  /// Hides the loader with a fade animation
  static void hide() => hideLoader();
}

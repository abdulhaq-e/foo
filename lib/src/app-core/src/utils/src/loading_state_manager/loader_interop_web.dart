import 'dart:js_interop';

/// JavaScript interop bindings for the UnderChamberLoader functionality
@JS('UnderChamberLoader')
external UnderChamberLoader get _underChamberLoader;

/// Interface for tenant colors JavaScript object
@JS()
@anonymous
extension type TenantColorsJS._(JSObject _) implements JSObject {
  external factory TenantColorsJS({String primary});

  external String get primary;
}

/// Interface for the UnderChamberLoader JavaScript object
@JS()
@anonymous
extension type UnderChamberLoader._(JSObject _) implements JSObject {
  /// Updates the loading text
  external void updateText(String text);

  /// Updates tenant information and styling
  external void updateTenantInfo(
    String? tenantName,
    TenantColorsJS? tenantColors,
  );

  /// Shows an error message
  external void showError(String message);

  /// Hides the loading screen with fade animation
  external void hide();
}

// Platform-specific implementations that match the stub interface

void updateLoaderText(String text) {
  _underChamberLoader.updateText(text);
}

void updateLoaderTenantInfo(String? tenantName, String? primaryColor) {
  final colors = primaryColor != null
      ? TenantColorsJS(primary: primaryColor)
      : null;
  _underChamberLoader.updateTenantInfo(tenantName, colors);
}

void showLoaderError(String message) {
  _underChamberLoader.showError(message);
}

void hideLoader() {
  _underChamberLoader.hide();
}

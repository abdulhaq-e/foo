import 'package:flutter/foundation.dart';
import 'loader_interop.dart';

class UIBootstrapper {
  const UIBootstrapper();

  void updateLoadingText(String text) {
    if (kIsWeb) {
      try {
        UnderChamberLoaderInterop.updateText(text);
      } catch (e) {
        // Ignore JS errors on non-web platforms or if loader not available
      }
    }
  }

  void updateTenantInfo(SaasTenantBranding tenant) {
    if (kIsWeb) {
      try {
        String? hexString;
        if (tenant.colors?.primary != null) {
          final color = tenant.colors!.primary!;
          hexString =
              '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
        }

        UnderChamberLoaderInterop.updateTenantInfo(
          tenant.tenantName,
          hexString,
        );
      } catch (e) {
        // Ignore JS errors on non-web platforms or if loader not available
      }
    }
  }

  void showError(String message) {
    if (kIsWeb) {
      try {
        UnderChamberLoaderInterop.showError(message);
      } catch (e) {
        // Ignore JS errors on non-web platforms or if loader not available
      }
    }
  }
}

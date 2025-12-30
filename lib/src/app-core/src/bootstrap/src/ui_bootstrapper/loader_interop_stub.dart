/// Stub implementation for non-web platforms
/// The loader is only available on web platforms where the HTML loader exists

void updateLoaderText(String text) {
  // No-op for non-web platforms
}

void updateLoaderTenantInfo(String? tenantName, String? primaryColor) {
  // No-op for non-web platforms
}

void showLoaderError(String message) {
  // No-op for non-web platforms
}

void hideLoader() {
  // No-op for non-web platforms
}

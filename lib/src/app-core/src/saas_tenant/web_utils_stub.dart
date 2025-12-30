// Stub implementation for non-web platforms
class Window {
  Location get location => Location();
}

class Location {
  String get hostname => '';
}

final window = Window();
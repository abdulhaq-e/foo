import 'package:material_ui/material_ui.dart';
import 'package:foo/core.dart';

class NavigationServiceTestDouble implements NavigationService {
  final List<NavigationCommand> navigated = [];
  String? closedModal;

  @override
  Future<void> navigate(NavigationCommand command) async {
    navigated.add(command);
  }

  @override
  Future<void> closeModal() async {
    closedModal = 'closed';
  }

  @override
  Future<void> presentModal(Widget scene) async {}

  @override
  RouterConfig<Object> get router => throw UnimplementedError();
}

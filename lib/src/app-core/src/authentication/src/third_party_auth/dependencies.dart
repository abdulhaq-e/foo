import 'package:foo/core.dart';

import 'backend_auth_callback.command.dart';
import 'backend_auth_callback_response.model.dart';

typedef BackendAuthCallbackCommandHandling
    = CommandHandling<BackendAuthCallbackCommand, BackendAuthCallbackResponse>;

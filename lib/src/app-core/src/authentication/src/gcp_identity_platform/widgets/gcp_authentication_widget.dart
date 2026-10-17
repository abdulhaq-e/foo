import 'package:bind_forms/bind_forms.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../internal.dart';

class GCPAuthenticationWidget extends StatefulWidget {
  const GCPAuthenticationWidget({super.key});

  @override
  State<GCPAuthenticationWidget> createState() =>
      _GCPAuthenticationWidgetState();
}

class _GCPAuthenticationWidgetState extends State<GCPAuthenticationWidget> {
  final _formGroup = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
  });

  bool _isSignUp = false;

  @override
  void dispose() {
    _formGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GCPAuthenticationBloc, GCPAuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Authentication failed: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthenticationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Authentication successful!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GCPAuthenticationInitial) {
          context.read<GCPAuthenticationBloc>().add(LoadSupportedAuthMethods());
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SupportedAuthMethodsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SupportedAuthMethodsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text('Failed to load authentication methods: ${state.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<GCPAuthenticationBloc>().add(
                      LoadSupportedAuthMethods(),
                    );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is SupportedAuthMethodsLoaded) {
          return _buildAuthenticationForm(
            context,
            state.supportedMethods,
            state is AuthenticationInProgress,
          );
        }

        if (state is AuthenticationInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AuthenticationError) {
          return Center(child: Text('Error: ${(state.error)}'));
        }
        if (state is AuthenticationSuccess) {
          return Center(child: Text('Redirecting'));
        }

        return Center(child: Text('Unknown state: ${state}'));
      },
    );
  }

  Widget _buildAuthenticationForm(
    BuildContext context,
    SupportedGCPAuthMethods supportedMethods,
    bool isLoading,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sign In to Continue',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Email/Password Form
          if (supportedMethods.emailPasswordEnabled) ...[
            Column(
              children: [
                TextControlBuilder(
                  control: _formGroup.formControl<String>('email'),
                  builder: (context, field) => TextField(
                    controller: field,
                    focusNode: field.focusNode,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email),
                      errorText: field.errorText(context),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 16),
                TextControlBuilder(
                  control: _formGroup.formControl<String>('password'),
                  builder: (context, field) => TextField(
                    controller: field,
                    focusNode: field.focusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      errorText: field.errorText(context),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Switch(
                      value: _isSignUp,
                      onChanged: (value) {
                        setState(() {
                          _isSignUp = value;
                        });
                      },
                    ),
                    Text(
                      _isSignUp
                          ? 'Create new account'
                          : 'Sign in to existing account',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ControlBuilder(
                    control: _formGroup,
                    builder: (context, formGroup) {
                      return ElevatedButton(
                        onPressed: isLoading || !formGroup.valid
                            ? null
                            : () {
                                final email = _formGroup
                                    .formControl<String>('email')
                                    .value!;
                                final password = _formGroup
                                    .formControl<String>('password')
                                    .value!;

                                context.read<GCPAuthenticationBloc>().add(
                                  AuthenticateWithEmailPassword(
                                    email: email,
                                    password: password,
                                    isSignUp: _isSignUp,
                                  ),
                                );
                              },
                        child: Text(_isSignUp ? 'Create Account' : 'Sign In'),
                      );
                    },
                  ),
                ),
              ],
            ),

            if (supportedMethods.oidcProviders.isNotEmpty) ...[
              const SizedBox(height: 32),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ],

          // OIDC Providers
          ...supportedMethods.oidcProviders.map((provider) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildOIDCButton(context, provider, isLoading),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildOIDCButton(
    BuildContext context,
    OIDCProvider provider,
    bool isLoading,
  ) {
    // Map provider IDs to appropriate buttons

    String providerType = provider.type;
    String providerId = provider.id;
    Buttons buttonType;
    String buttonText = 'Continue with ${provider.name}';
    Map<String, String> parameters = {};

    switch (providerType.toLowerCase()) {
      case 'google':
        buttonType = Buttons.Google;
        String? hdParameter = provider.parameters["hd"] as String?;
        if (hdParameter != null) {
          parameters["hd"] = hdParameter;
        }
        break;
      case 'microsoft':
        buttonType = Buttons.Microsoft;
        break;
      case 'apple':
        buttonType = Buttons.AppleDark;
        break;
      case 'facebook':
        buttonType = Buttons.Facebook;
        break;
      case 'github':
        buttonType = Buttons.GitHub;
        break;
      case 'twitter':
        buttonType = Buttons.Twitter;
        break;
      case 'linkedin':
        buttonType = Buttons.LinkedIn;
        break;
      default:
        // Fallback to a generic button
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            onPressed: isLoading
                ? null
                : () {
                    context.read<GCPAuthenticationBloc>().add(
                      AuthenticateWithOIDC(
                        providerId: providerId,
                        parameters: provider.parameters,
                      ),
                    );
                  },
            icon: const Icon(Icons.login),
            label: Text(buttonText),
          ),
        );
    }

    return SignInButton(
      buttonType,
      text: buttonText,
      onPressed: isLoading
          ? null
          : () {
              context.read<GCPAuthenticationBloc>().add(
                AuthenticateWithOIDC(providerId: providerId),
              );
            },
    );
  }
}

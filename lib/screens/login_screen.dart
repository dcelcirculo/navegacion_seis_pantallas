import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const LoginScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  void login(BuildContext context) {
    AuthService.isLoggedIn = true;
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    // Extraemos los estilos del tema
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Login'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => login(context),
          child: const Text('Login'),
        ),
      ),
    );
  }
}

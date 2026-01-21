import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ProfileScreen({
    super.key,
    required this.username,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    // Extraemos los estilos del tema
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido, $username!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 30),
            // Boton para ir a la pantalla de productos
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.products),
              child: const Text('Ir a Productos'),
            ),
            const SizedBox(height: 10),
            // Boton para ir a la pantalla anterior: Home
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver a Home'),
            ),
          ],
        ),
      ),
    );
  }
}

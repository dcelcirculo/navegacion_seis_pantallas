import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  void goToProfile(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.profile,
      arguments: 'Carolina',
    ); // Pass 'Carolina' as an argument to the profile screen
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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => goToProfile(context),
            child: const Text('Ir al Perfil'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ir al Login'),
          ),
        ],
      ),
    );
  }
}

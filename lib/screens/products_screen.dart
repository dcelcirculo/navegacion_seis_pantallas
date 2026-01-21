import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ProductsScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ProductsScreen({
    super.key,
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
        title: const Text('Productos'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Productos diponibles:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 30),
            // Botón Producto 1
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.productOne),
              child: const Text('Producto 1'),
            ),
            const SizedBox(height: 10),
            // Botón Producto 2
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.productTwo),
              child: const Text('Producto 2'),
            ),
            const SizedBox(height: 10),
            // Botón para ir a la pantalla anterior: Perfil
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

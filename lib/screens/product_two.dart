import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class ProductTwo extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ProductTwo({
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
        title: const Text('Volverás a Alaska'),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Column(
        children: [
          // Imagen del producto
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Icon(Icons.book, size: 150, color: colors.primary),
              ),
            ),
          ),
          // Detalle del producto
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Titulo del producto
                  Text(
                    'Volverás a Alaska / The Great Alone (Spanish Edition)',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  //Descripcion del producto
                  Text(
                    'Una novela conmovedora que narra la historia de una familia que se muda a Alaska en busca de una nueva vida, enfrentando desafíos y descubriendo la fuerza del amor y la resiliencia.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),

                  Row(
                    children: [
                      const Chip(label: Text('Novela')),
                      const SizedBox(width: 10.0),
                      Chip(
                        avatar: const Icon(Icons.star, size: 16),
                        label: const Text("4.5"),
                        backgroundColor: colors.tertiaryContainer,
                        labelStyle: TextStyle(
                          color: colors.onTertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  //Barra de precio y acción
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Precio final", style: textTheme.bodySmall),
                          Text(
                            "\$18.95",
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colors.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Boton de acción
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton.icon(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 15.0,
                          ),
                        ),
                        icon: const Icon(Icons.shopping_bag_outlined),
                        label: const Text('Agregar al carrito'),
                      ),
                      FilledButton.icon(
                        onPressed: () => Navigator.pop(context),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 15.0,
                          ),
                        ),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Regresar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

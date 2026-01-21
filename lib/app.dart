import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'services/auth_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/products_screen.dart';
import 'screens/product_one.dart';
import 'screens/product_two.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  void _toggleTheme() {
    setState(() => _isDark = !_isDark);
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    // Si intenta ir a home sin estar logueado, redirige a login
    if (settings.name == AppRoutes.home && !AuthService.isLoggedIn) {
      return MaterialPageRoute(
        builder: (_) =>
            LoginScreen(toggleTheme: _toggleTheme, isDarkMode: _isDark),
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) =>
              LoginScreen(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) =>
              HomeScreen(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
      case AppRoutes.profile:
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(
            username: username,
            toggleTheme: _toggleTheme,
            isDarkMode: _isDark,
          ),
        );
      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (_) =>
              ProductsScreen(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
      case AppRoutes.productOne:
        return MaterialPageRoute(
          builder: (_) =>
              ProductOne(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
      case AppRoutes.productTwo:
        return MaterialPageRoute(
          builder: (_) =>
              ProductTwo(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              LoginScreen(toggleTheme: _toggleTheme, isDarkMode: _isDark),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 243, 189, 237),
    );
    final darkScheme = ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 240, 161, 229),
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
      darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: _generateRoute,
    );
  }
}

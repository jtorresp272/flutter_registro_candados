import 'package:candado_nettel_v1/screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../screen/home_screen.dart';
import '../widgets/QRScanner.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String qrScanner = '/qrScanner';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case qrScanner:
        return MaterialPageRoute(builder: (_) => const QRScannerScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Ruta no encontrada')),
              ),
        );
    }
  }
}

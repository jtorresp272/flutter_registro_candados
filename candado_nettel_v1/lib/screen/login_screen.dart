import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/appBar_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appBarProvider = Provider.of<AppBarProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                appBarProvider.setUserType(UserType.taller);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Ingresar como Taller'),
            ),
            ElevatedButton(
              onPressed: () {
                appBarProvider.setUserType(UserType.monitoreo);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Ingresar como Monitoreo'),
            ),
            ElevatedButton(
              onPressed: () {
                appBarProvider.setUserType(UserType.puerto);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Ingresar como Puerto'),
            ),
          ],
        ),
      ),
    );
  }
}

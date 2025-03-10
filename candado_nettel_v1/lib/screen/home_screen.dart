import 'package:candado_nettel_v1/core/app_route.dart';
import 'package:candado_nettel_v1/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.qrScanner);
          },
          child: Text('Scanner'),
        ),
      ),
    );
  }
}

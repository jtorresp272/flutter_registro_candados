import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/appBar_provider.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarProvider>(
      builder: (context, appBarProvider, child) {
        return AppBar(
          automaticallyImplyLeading: false,
          title: appBarProvider.title,
          actions: appBarProvider.actions,
          backgroundColor: Colors.white,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

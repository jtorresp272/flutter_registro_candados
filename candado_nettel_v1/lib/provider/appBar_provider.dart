// ignore: file_names
import 'package:flutter/material.dart';

enum UserType { taller, monitoreo, puerto } // Definir tipos de usuario

class AppBarProvider extends ChangeNotifier {
  // Definicion de variables privadas
  Widget _title = Text('Inicio');
  List<Widget> _actions = [];

  // Funciones get para obtener mis variables privadas
  Widget get title => _title;
  List<Widget> get actions => _actions;

  void setUserType(UserType userType) {
    switch (userType) {
      case UserType.taller:
        _title = _customTitle('Taller');
        _actions = [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              debugPrint('Configuraciones de taller');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              debugPrint('Cerrar sesión');
            },
          ),
        ];
        break;
      case UserType.monitoreo:
        _title = _customTitle('Monitoreo');
        _actions = [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              debugPrint('Modo Edición Activado');
            },
          ),
        ];
        break;
      case UserType.puerto:
        _title = _customTitle('Puerto');
        _actions = [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              debugPrint('Viendo contenido');
            },
          ),
        ];
        break;
    }
    notifyListeners();
  }
}

Column _customTitle(String user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Consorcio Nettel', style: _style(color: Colors.black)),
      Text(user, style: _style(color: Colors.black)),
    ],
  );
}

TextStyle _style({required Color color}) {
  return TextStyle(color: color, fontWeight: FontWeight.bold);
}

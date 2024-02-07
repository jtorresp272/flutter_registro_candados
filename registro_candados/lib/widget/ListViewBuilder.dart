import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_candados/class/datos.dart';

class Taller extends StatefulWidget {
  const Taller({super.key});

  @override
  State<Taller> createState() => _TallerState();
}

class _TallerState extends State<Taller> {
  late List<Candado> listaCandadosTaller; // Lista de Candado taller
  late List<Candado> listaFiltradaTaller; // Lista de Candado taller filtrada
  late List<Candado> listaCandadosLlegar; // Lista de Candado llegar
  late List<Candado> listaFiltradaLlegar; // Lista de Candado llegar filtrada
  late FocusNode _searchFocusNodeTaller;
  late FocusNode _searchFocusNodeLlegar;
  TextEditingController _textControllerTaller = TextEditingController();
  TextEditingController _textControllerLlegar = TextEditingController();

  late int _selectedIndex = 0; // Definición de _selectedIndex

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Realiza las acciones correspondientes a cada índice aquí
    // Por ejemplo:
    if (_selectedIndex == 0) {
      //   // Acciones para el índice 0 (Inicio)
    } else if (_selectedIndex == 1) {
      //   // Acciones para el índice 1 (Buscar)
    } else if (_selectedIndex == 2) {
      //   // Acciones para el índice 2 (Perfil)
    }
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNodeTaller = FocusNode();
    _searchFocusNodeLlegar = FocusNode();
    listaCandadosTaller =
        generarCandadosAleatoriosTaller(); // Genera la lista de Candado al iniciar el widget
    listaCandadosLlegar =
        generarCandadosAleatoriosLlegar(); // Genera la lista de Candado al iniciar el widget
    listaFiltradaTaller = List.from(listaCandadosTaller);
    listaFiltradaLlegar = List.from(listaCandadosLlegar);
  }

  void filtrarListaTaller(String query) {
    setState(() {
      if (query.isEmpty) {
        listaFiltradaTaller = List.from(
            listaCandadosTaller); // Restablece la lista filtrada si el campo de búsqueda está vacío
      } else {
        listaFiltradaTaller = listaCandadosTaller
            .where((candado) => candado.numero.contains(query))
            .toList();
      }
    });
  }

  void filtrarListaLlegar(String query) {
    setState(() {
      if (query.isEmpty) {
        listaFiltradaLlegar = List.from(
            listaCandadosLlegar); // Restablece la lista filtrada si el campo de búsqueda está vacío
      } else {
        listaFiltradaLlegar = listaCandadosLlegar
            .where((candado) => candado.numero.contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('practica list view'),
      ),
      resizeToAvoidBottomInset:
          false, // Evita que la pantalla se ajuste cuando aparece el teclado
      body: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Colors.blueAccent,
                indicatorColor: Colors.blueAccent,
                tabs: [
                  Tab(
                    text: 'Resumen',
                  ),
                  Tab(
                    text: 'En Taller',
                  ),
                  Tab(text: 'Por Llegar'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Página 1: "Resumen"
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('data'),
                  ),
                  // Página 2: "En Taller"
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, bottom: 5.0),
                          child: TextField(
                            focusNode: _searchFocusNodeTaller,
                            controller: _textControllerTaller,
                            onChanged: filtrarListaTaller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //hintText: '0093...',
                              labelText: 'Buscar',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde del TextField
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde cuando el TextField no está enfocado
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde cuando el TextField está enfocado
                              ),

                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _textControllerTaller.clear();
                                    filtrarListaTaller('');
                                    if (_textControllerTaller.text.isEmpty) {
                                      _searchFocusNodeTaller.requestFocus();
                                    }
                                  });
                                },
                                icon: (_textControllerTaller.text.isEmpty)
                                    ? const Icon(Icons.search)
                                    : const Icon(Icons.close),
                                iconSize: 20.0,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal:
                                      10.0), // Ajusta el espacio dentro del TextField
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: listaFiltradaTaller.length,
                            itemBuilder: (BuildContext context, int index) {
                              Color colorContenedor = Colors.transparent;

                              switch (listaCandadosTaller[index].lugar) {
                                case 'I':
                                  colorContenedor = Colors.orange;
                                  break;
                                case 'M':
                                  colorContenedor = Colors.yellow;
                                  break;
                                case 'L':
                                  colorContenedor = Colors.green;
                                  break;
                                case 'V':
                                  colorContenedor = Colors.red;
                                  break;
                                default:
                                  colorContenedor = Colors.transparent;
                                  break;
                              }

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: colorContenedor,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ListTile(
                                  trailing: IconButton(
                                    onPressed: () {
                                      print('item $index');
                                    },
                                    icon: const Icon(Icons.expand_more),
                                  ),
                                  leading: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/candado_ejemplo.jpg',
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  title: Text(
                                    listaFiltradaTaller[index].numero,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    DateFormat('yyyy-MM-dd').format(
                                        listaFiltradaTaller[index]
                                            .fechaIngreso), // Puedes cambiar aquí por la fecha que necesites
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Página 3: "Por Llegar"
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, bottom: 5.0),
                          child: TextField(
                            focusNode: _searchFocusNodeLlegar,
                            controller: _textControllerLlegar,
                            onChanged: filtrarListaLlegar,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //hintText: '0093...',
                              labelText: 'Buscar',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde del TextField
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde cuando el TextField no está enfocado
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors
                                        .grey), // Color del borde cuando el TextField está enfocado
                              ),

                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _textControllerLlegar.clear();
                                    filtrarListaLlegar('');
                                    if (_textControllerLlegar.text.isEmpty) {
                                      _searchFocusNodeLlegar.requestFocus();
                                    }
                                  });
                                },
                                icon: (_textControllerLlegar.text.isEmpty)
                                    ? const Icon(Icons.search)
                                    : const Icon(Icons.close),
                                iconSize: 20.0,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal:
                                      10.0), // Ajusta el espacio dentro del TextField
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: listaFiltradaLlegar.length,
                            itemBuilder: (BuildContext context, int index) {
                              Color colorContenedor = Colors.grey;

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: colorContenedor,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ListTile(
                                  trailing: IconButton(
                                    onPressed: () {
                                      print('item $index');
                                    },
                                    icon: const Icon(Icons.expand_more),
                                  ),
                                  leading: Text(
                                    listaFiltradaLlegar[index].numero,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  title: Text(
                                    listaFiltradaLlegar[index]
                                        .fechaIngreso
                                        .toString(), // Puedes cambiar aquí por la fecha que necesites
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2_outlined),
            label: 'Escanear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Actualizar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Historial',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _textControllerTaller.dispose();
    _textControllerLlegar.dispose();
    _searchFocusNodeTaller.dispose();
    _searchFocusNodeLlegar.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:registro_candados/class/datos.dart';

class ListViewBuilderExample extends StatefulWidget {
  const ListViewBuilderExample({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  late List<Candado> listaCandados; // Lista de Candado
  late List<Candado> listaFiltrada; // Lista de Candado filtrada
  bool _showTextField = false;
  TextEditingController _textController = TextEditingController();

 @override
  void initState() {
    super.initState();
    listaCandados = generarCandadosAleatorios(); // Genera la lista de Candado al iniciar el widget
    listaFiltrada = List.from(listaCandados);
  }

  void filtrarLista(String query) {
    setState(() {
      if (query.isEmpty) {
        listaFiltrada = List.from(listaCandados); // Restablece la lista filtrada si el campo de búsqueda está vacío
      } else {
        listaFiltrada = listaCandados.where((candado) => candado.numero.contains(query)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba list'),
      ),
      resizeToAvoidBottomInset: false, // Evita que la pantalla se ajuste cuando aparece el teclado
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'En Taller',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showTextField = !_showTextField;
                          });
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  if (_showTextField)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 5.0),
                      child: TextField(
                        controller: _textController,
                        onChanged: filtrarLista,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0093...',
                          labelText: 'Buscar',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey), // Color del borde del TextField  
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey), // Color del borde cuando el TextField no está enfocado
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey), // Color del borde cuando el TextField está enfocado
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _textController.clear();  
                                filtrarLista('');
                              });
                            },
                            icon: const Icon(Icons.close),
                            iconSize: 20.0,
                          ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Ajusta el espacio dentro del TextField
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listaFiltrada.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color colorContenedor = Colors.transparent;
      
                        switch (listaCandados[index].lugar) {
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
                          margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
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
                              listaFiltrada[index].numero,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            title: Text(
                              listaFiltrada[index].fechaIngreso.toString(), // Puedes cambiar aquí por la fecha que necesites
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Por llegar',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
              
                  Expanded(          
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 171, 178, 182),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            trailing: const Icon(Icons.expand_more),
                            leading: const Text(
                              '0093',
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            title: const Text(
                              '12/12/2020',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            //subtitle: const Text('Aqui va la descripcion del candado'),
                    
                            onTap: () {
                              print('item $index');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ),
          ],
        ),
      );
    }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

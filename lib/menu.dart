import 'package:flutter/material.dart';
import 'dogs_list.dart'; // Importa el archivo que contiene la pantalla DogList
import 'adopcion.dart'; // Importa el archivo que contiene la pantalla Adopcion
import 'login.dart'; // Importa el archivo que contiene la pantalla LoginScreen

class CustomMenu extends StatelessWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Aquí puedes manejar la opción seleccionada del menú
        if (value == 'opcion1') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DogsList()),
          );
        } else if (value == 'opcion2') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Adopcion()),
          );
        } else if (value == 'opcion3') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'opcion1',
            child: Text('Adoptar'),
          ),
          const PopupMenuItem<String>(
            value: 'opcion2',
            child: Text('Dar en adopción'),
          ),
          const PopupMenuItem<String>(
            value: 'opcion3',
            child: Text('Cerrar sesión'),
          ),
        ];
      },
    );
  }
}

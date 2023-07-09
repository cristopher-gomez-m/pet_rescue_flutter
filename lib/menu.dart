import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Aquí puedes manejar la opción seleccionada del menú
        if (value == 'opcion1') {
          // Acción para la opción 1
        } else if (value == 'opcion2') {
          // Acción para la opción 2
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

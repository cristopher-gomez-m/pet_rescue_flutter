// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class SolicitudPage extends StatelessWidget {
  const SolicitudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitud de adopción'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  'Ingrese nombres completos',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7689DE)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  'Ingrese número de contacto',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7689DE)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  '¿Por qué está interesado/a en adoptar este perro?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7689DE)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  '¿Dónde vives actualmente?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Casa',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Casa'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Apartamento',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Apartamento'),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  '¿Tienes un patio o espacio al aire libre?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Sí',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Sí'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'No',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('No'),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  '¿Cuánto tiempo pasarás con el perro al día?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: '1-3 horas',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Entre 1 y 3 horas al día'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: '3-5 horas',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Entre 3 y 5 horas al día'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: '5+ horas',
                          groupValue: null,
                          onChanged: null,
                        ),
                        Text('Más de 5 horas al día'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para solicitar la adopción
                    },
                    child: const Text(
                      'Enviar Solicitud',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          const Color(0xFF7689DE), // Color de fondo solicitado
                      minimumSize:
                          const Size(double.infinity, 50), // Ancho mínimo del botón
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

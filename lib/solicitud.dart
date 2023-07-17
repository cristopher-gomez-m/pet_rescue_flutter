// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
class SolicitudPage extends StatefulWidget {
  const SolicitudPage({Key? key}) : super(key: key);

  @override
  _SolicitudPage createState() => _SolicitudPage();
}


class _SolicitudPage extends State<SolicitudPage> {
late TextEditingController nombresController;
  late TextEditingController telefonoController;
  late TextEditingController interesController;
  String? vivienda;
  String? espacio;
  String? tiempo;

@override
  void initState() {
    super.initState();
    nombresController = TextEditingController();
    telefonoController = TextEditingController();
    interesController = TextEditingController();
  }

  @override
  void dispose() {
    nombresController.dispose();
    telefonoController.dispose();
    interesController.dispose();
    super.dispose();
  }

void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void _showSuccessSnackBar(BuildContext context) {
    _showAlertDialog(context, 'Solicitud enviada correctamente');
  }


Future<void> insertarSolicitud() async{
 final database = await MyOpenHelper.initDatabase();

 await database.insert(
      'solicitudes',
      {
        'nombres': nombresController.text,
        'telefono': telefonoController.text,
        'interes': interesController.text,
        'vivienda': vivienda,
        'espacio': espacio,
        'tiempo': tiempo,
      },
    );

    await database.close();

    // Restablecer los campos después de la inserción
    nombresController.clear();
    telefonoController.clear();
    interesController.clear();
    vivienda = null;
    espacio = null;
    tiempo = null;
}


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
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: nombresController,
                  decoration: const InputDecoration(
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
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Casa',
                          groupValue: vivienda,
                          onChanged: (value){
                            setState(() {
                              vivienda = value;
                            });
                          },
                        ),
                        const Text('Casa'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Apartamento',
                          groupValue: vivienda,
                          onChanged: (value) {
                            setState(() {
                              vivienda = value;
                            });
                          },
                        ),
                        const Text('Apartamento'),
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
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Sí',
                          groupValue: espacio,
                          onChanged: (value) {
                            setState(() {
                              espacio = value;
                            });
                          },
                        ),
                        const Text('Sí'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'No',
                          groupValue: espacio,
                          onChanged: (value) {
                            setState(() {
                              espacio = value;
                            });
                          },
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
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: '1-3 horas',
                          groupValue: tiempo,
                          onChanged: (value) {
                            setState(() {
                              tiempo = value;
                            });
                          },
                        ),
                        const Text('Entre 1 y 3 horas al día'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: '3-5 horas',
                          groupValue: tiempo,
                          onChanged: (value) {
                            setState(() {
                              tiempo = value;
                            });
                          },
                        ),
                        const Text('Entre 3 y 5 horas al día'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: '5+ horas',
                          groupValue: tiempo,
                          onChanged: (value) {
                            setState(() {
                              tiempo = value;
                            });
                          },
                        ),
                        const Text('Más de 5 horas al día'),
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
                    onPressed: () async {
                      await insertarSolicitud().then((_) => 
                       _showSuccessSnackBar(context));
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

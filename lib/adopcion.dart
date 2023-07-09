// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
import 'package:pet_rescue_flutter/user_service.dart';
class Adopcion extends StatefulWidget {
  const Adopcion({Key? key}) : super(key: key);

  @override
  _AdopcionState createState() => _AdopcionState();
}

class _AdopcionState extends State<Adopcion> {
  XFile? _selectedImage;
final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _razaController = TextEditingController();
  String _tamanioSeleccionado = 'Pequeño';
  String _generoSeleccionado = 'Macho';
  bool _rabiaSeleccionada = false;
  bool _parvovirusSeleccionado = false;
  bool _moquilloSeleccionado = false;
  bool _hepatitisSeleccionada = false;


  Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedImage;
      print('IMgaen  aquiiiiiiii: $_selectedImage');
    });
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
    _showAlertDialog(context, 'Cuenta creada');
  }
  Future<void> _guardarDatos() async {
    final database = await MyOpenHelper.initDatabase();
  
    final nombre = _nombreController.text;
    final edad = _edadController.text;
    final raza = _razaController.text;
    final tamanio = _tamanioSeleccionado;
    final genero = _generoSeleccionado;
 // Verificar si las vacunas son nulas antes de usarlas en la condición
  final vac1 = _rabiaSeleccionada != null ? (_rabiaSeleccionada ? 'Sí' : 'No') : 'No';
  final vac2 = _parvovirusSeleccionado != null ? (_parvovirusSeleccionado ? 'Sí' : 'No') : 'No';
  final vac3 = _moquilloSeleccionado != null ? (_moquilloSeleccionado ? 'Sí' : 'No') : 'No';
  final vac4 = _hepatitisSeleccionada != null ? (_hepatitisSeleccionada ? 'Sí' : 'No') : 'No';

    final imagenPath = _selectedImage?.path ?? '';
      final imageFile = File(imagenPath);
      final realPath = imageFile.path;
      print('IMgaen  aquiiiiiiii: $realPath');
    await database.insert('dogs', {
      'nombre': nombre,
      'edad': edad,
      'raza': raza,
      'tamaño': tamanio,
      'genero': genero,
    'vac1': vac1,
    'vac2': vac2,
    'vac3': vac3,
    'vac4': vac4,
      'imagen_path': realPath,
      'usuario_id': UserService.instance.userId,
    });
  
    await database.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de mascotas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 32.0),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/perro.png',
                  width: 128,
                  height: 128,
                ),
              ),
              const SizedBox(height: 16.0),
               Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.pets,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
               Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    controller: _edadController,
                    decoration: const InputDecoration(
                      labelText: 'Edad (años o meses)',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.cake,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
               Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    controller: _razaController,
                    decoration: const InputDecoration(
                      labelText: 'Raza',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.pets,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tamaño',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.height,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                    value: null,
                    onChanged: (String? newValue) {
                      // Lógica para manejar el cambio de valor seleccionado
                    },
                    items: <String>['Pequeño', 'Mediano', 'Grande']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  '¿Cuál es el género del animal?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Macho',
                        groupValue: _generoSeleccionado,
                        onChanged: (value) {
                           setState(() {
                            _generoSeleccionado = value.toString();
                          });
                        },
                      ),
                      const Text(
                        'Macho',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Hembra',
                        groupValue: _generoSeleccionado,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                          setState(() {
                            _generoSeleccionado = value.toString();
                          });
                        },
                      ),
                      const Text(
                        'Hembra',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '¿Cuenta con estas vacunas?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rabiaSeleccionada,
                        onChanged: (value) {
                         setState(() {
                            _rabiaSeleccionada = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Rabia',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _parvovirusSeleccionado,
                        onChanged: (value) {
                          setState(() {
                            _parvovirusSeleccionado = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Parvovirus canino',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _moquilloSeleccionado,
                        onChanged: (value) {
                           setState(() {
                            _moquilloSeleccionado = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Moquillo',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _hepatitisSeleccionada,
                        onChanged: (value) {
                          setState(() {
                            _hepatitisSeleccionada = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Hepatitis canina',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  'Seleccione una foto',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      child: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!.path),
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _openGallery,
                        child: const Text('Abrir galería'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Lógica para manejar el botón "Registrar"
                           await _guardarDatos().then((_) {
                            _showSuccessSnackBar(context);
                          });
                          },
                          child: const Text('Registrar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

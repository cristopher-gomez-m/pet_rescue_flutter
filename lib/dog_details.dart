import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
import 'dart:io';

class DogDetails extends StatelessWidget {
  final int dogId;

  const DogDetails({super.key, required this.dogId});
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? protectorData;

    Future<Map<String, dynamic>> fetchDogData() async {
      final database = await MyOpenHelper.initDatabase();
      final List<Map<String, dynamic>> result = await database.query(
        'dogs',
        where: 'id = ?',
        whereArgs: [dogId],
      );

      if (result.isNotEmpty) {
        final Map<String, dynamic> dogData = result.first;
        final int protectorId = dogData['usuario_id'] ?? 0;

        final List<Map<String, dynamic>> protectorResult = await database.query(
          'usuarios',
          where: 'id = ?',
          whereArgs: [protectorId],
        );

        protectorData =
            protectorResult.isNotEmpty ? protectorResult.first : null;
      }

      await database.close();

      return result.isNotEmpty ? result.first : {};
    }

    Future<Map<String, dynamic>> fetchProtectorData(String protectorId) async {
      final database = await MyOpenHelper.initDatabase();
      final List<Map<String, dynamic>> result = await database.query(
        'usuarios',
        where: 'id = ?',
        whereArgs: [protectorId],
      );
      await database.close();

      return result.isNotEmpty ? result.first : {};
    }

    // Llamada a la función para obtener los datos del perro al construir el widget
    fetchDogData();
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchDogData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Informacion'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Detalles del perro'),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Detalles del perro'),
            ),
            body: Center(
              child: Text('No hay datos'),
            ),
          );
        } else {
          Map<String, dynamic> dogData = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text('Detalles del perro'),
            ),
            body: ListView(
              children: [
                Center(
                  child: Image.file(
                    File(dogData['imagen_path']),
                    fit: BoxFit.cover,
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.pets), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Nombre: ${dogData['nombre']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.cake), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Edad: ${dogData['edad']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.height), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Tamaño: ${dogData['tamaño']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.pets), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Raza: ${dogData['raza']}'),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Vacunas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.vaccines), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Rabia: ${dogData['vac1']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.vaccines), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Parvovirus canino: ${dogData['vac2']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.vaccines), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Moquillo: ${dogData['vac3']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.vaccines), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Moquillo: ${dogData['vac4']}'),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Datos del protector',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Nombre: ${protectorData!['nombre']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.phone), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Telefono: ${protectorData!['telefono']}'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.email), // Agregar el icono deseado
                        SizedBox(width: 8.0),
                        Text('Email: ${protectorData!['email']}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Perform account creation logic here
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50.0),
                        backgroundColor: const Color(0xFF7689DE),
                      ),
                      child: const Text(
                        'Solicitar adopción',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

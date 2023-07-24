import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:pet_rescue_flutter/dog_details.dart';
import 'dart:convert';
import 'menu.dart';

class DogsList extends StatefulWidget {
  const DogsList({Key? key}) : super(key: key);

  @override
  _DogsListState createState() => _DogsListState();
}

class _DogsListState extends State<DogsList> {
  late Future<List<Map<String, dynamic>>> _dogsFuture;

  @override
  void initState() {
    super.initState();
    _dogsFuture = _fetchDogs();
  }

  Future<List<Map<String, dynamic>>> _fetchDogs() async {
    final database = await MyOpenHelper.initDatabase();

    final dogs = await database.query('dogs');
    print('Dogs: $dogs'); // Imprimir los datos por consola
    await database.close();

    return dogs;
  }

  List<Map<String, dynamic>> _convertToDogsJson(
      List<Map<String, dynamic>> dogs) {
    List<Map<String, dynamic>> dogsJson = [];
    for (var dogData in dogs) {
      String nombre = dogData['nombre'];
      String raza = dogData['raza'];
      String imagenPath = dogData['imagen_path'];

      Map<String, dynamic> dogJson = {
        'nombre': nombre,
        'raza': raza,
        'imagen_path': imagenPath,
      };

      dogsJson.add(dogJson);
    }
    return dogsJson;
  }

  String _generateJsonString(List<Map<String, dynamic>> dogsJson) {
    return json.encode(dogsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetRescue'),
        actions: const [
          CustomMenu(),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _dogsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('');
          } else {
            List<Map<String, dynamic>> dogsData = snapshot.data!;
            List<Map<String, dynamic>> dogsJson = _convertToDogsJson(dogsData);
            String jsonString = _generateJsonString(dogsJson);

            // Imprimir el JSON generado en la consola
            print("JSON generado:");
            print(jsonString);

            return Container(
              color: Colors.white, // Cambiar el color de fondo de la pantalla
              child: ListView.builder(
                itemCount: dogsData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> dogData = dogsData[index];
                  String nombre = dogData['nombre'];
                  String raza = dogData['raza'];
                  String imagenPath = dogData['imagen_path'];

                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.file(File(imagenPath)),
                      title: Text(nombre),
                      subtitle: Text(raza),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Ver más"
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DogDetails(dogId: dogData['id']),
                            ),
                          );
                        },
                        child: Text('Ver más'),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

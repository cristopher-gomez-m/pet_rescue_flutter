import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:pet_rescue_flutter/dog_details.dart';

class DogsList extends StatefulWidget {
  const DogsList({super.key});

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _dogsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No hay datos');
        } else {
          return Container(
              color: Colors.white, // Cambiar el color de fondo de la pantalla
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> dogData = snapshot.data![index];
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
              ));
        }
      },
    );
  }
}

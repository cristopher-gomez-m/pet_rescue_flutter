import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrearCuenta createState() => _CrearCuenta();
}

class _CrearCuenta extends State<CrearCuenta> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
   

    Future<Database> initDatabase() async {
      late Future<Database> database;
      final databasePath = await getDatabasesPath();
      final pathToDatabase = path.join(databasePath, 'my_database.db');
      database = openDatabase(
        pathToDatabase,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            '''
          CREATE TABLE IF NOT EXISTS accounts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
          ''',
          );
        },
      );
      return database;
    }

    @override
    Future<void> initState() async {
      super.initState();
      await initDatabase();
    }

    initState();

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

    Future<void> _insertAccount(String email, String password) async {
      var db = await initDatabase();
      await db.insert(
        'accounts',
        {'email': email, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // ignore: use_build_context_synchronously
      _showAlertDialog(context, 'Cuenta creada');
    }

    void _showSuccessSnackBar(BuildContext context) {
      _showAlertDialog(context, 'Cuenta creada');
    }

    bool _validateFields() {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        _showAlertDialog(context, 'Por favor, complete todos los campos.');
        return false;
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/perro.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              /*
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nombre', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Apellido', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'telefono', prefixIcon: Icon(Icons.phone)),
              ),
              */
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller:passwordController,
                decoration: const InputDecoration(
                  labelText: 'contrasena',
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform login logic here
                      if (_validateFields()){
                        _insertAccount(
                          emailController.text,
                          passwordController.text,
                        ).then((_){
                          _showSuccessSnackBar(context);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(5.0),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Login'),
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

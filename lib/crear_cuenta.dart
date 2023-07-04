import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _CrearCuenta createState()=> _CrearCuenta();
}

class _CrearCuenta extends State<CrearCuenta>{
  @override
  Widget build(BuildContext context) {
    Future<Database> database;

  @override
  void initState() {
    super.initState();
    //_initDatabase();
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
                decoration: const InputDecoration(
                    labelText: 'email', prefixIcon: Icon(Icons.email)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'contrasena', prefixIcon: Icon(Icons.password)),
              ),
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform login logic here
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

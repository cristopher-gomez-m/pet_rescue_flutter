import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrearCuenta createState() => _CrearCuenta();
}

class _CrearCuenta extends State<CrearCuenta> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController telefonoController = TextEditingController();
    TextEditingController direccionController = TextEditingController();
    @override
    Future<void> initState() async {
      super.initState();
      await MyOpenHelper.initDatabase();
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

    Future<void> _insertAccount() async {
      var db = await MyOpenHelper.initDatabase();
      String email = emailController.text;
      String password = passwordController.text;
      String nombre = nombreController.text;
      String apellido = apellidoController.text;
      String telefono = telefonoController.text;
      String direccion = direccionController.text;
      await db.insert(
        'usuarios',
        {
          'email': email,
          'password': password,
          'nombre': nombre,
         'apellido': apellido,
          'telefono':telefono,
          'direccion':direccion
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // ignore: use_build_context_synchronously
      _showAlertDialog(context, 'Cuenta creada');
    }

    void _showSuccessSnackBar(BuildContext context) {
      _showAlertDialog(context, 'Cuenta creada');
    }

    bool _validateFields() {
      if (emailController.text.isEmpty || passwordController.text.isEmpty
      /*|| nombreController.text.isEmpty || apellidoController.text.isEmpty
      || telefonoController.text.isEmpty || direccionController.text.isEmpty*/) {
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
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(
                  labelText: 'telefono',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              TextFormField(
                controller: direccionController,
                decoration: const InputDecoration(
                  labelText: 'direccion',
                  prefixIcon: Icon(Icons.house),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: passwordController,
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
                    onPressed: () async {
                      // Perform login logic here
                      if (_validateFields()) {
                       await _insertAccount().then((_) {
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

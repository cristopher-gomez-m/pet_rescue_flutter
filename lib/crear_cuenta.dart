import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';

class CrearCuenta extends StatefulWidget {
  const CrearCuenta({super.key});
   @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MyOpenHelper.initDatabase();
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
        'telefono': telefono,
        'direccion': direccion
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          margin: const EdgeInsets.only(top: 100.0),
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
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.person, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
              ),
              TextFormField(
                controller: apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.person, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
              ),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.phone, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
                keyboardType: TextInputType.phone, // Establece el tipo de teclado a numérico
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Acepta solo dígitos
                ],
              ),
              TextFormField(
                controller: direccionController,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.house, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Color(0xFF7689DE)),
                  prefixIcon: Icon(Icons.password, color: Color(0xFF7689DE)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7689DE)),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 32.0), // Padding hacia abajo
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_validateFields()) {
                          await _insertAccount().then((_) {
                            _showSuccessSnackBar(context);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50.0),
                        backgroundColor: const Color(0xFF7689DE),
                      ),
                      child: const Text(
                        'Crear cuenta',
                        style: TextStyle(fontSize: 18.0),
                      ),
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
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/crear_cuenta.dart';
import 'package:pet_rescue_flutter/principal.dart';
import 'package:pet_rescue_flutter/MyOpenHelper.dart';
import 'package:pet_rescue_flutter/user_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Future<bool> loginUser(String email, String password) async {
      final db = await MyOpenHelper.initDatabase();

      final result = await db.query(
        'usuarios',
        where: 'email = ?',
        whereArgs: [email],
        limit: 1,
      );

      if (result.isNotEmpty) {
        final storedPassword = result.first['password'] as String;
        if (password == storedPassword) {
          final userId = result.first['id'] as int;
          UserService.instance.userId = userId;
          return true;
        } else {
          return false;
        }
      }

      return false;
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/perro.png',
                  width: 128.0,
                  height: 128.0,
                ),
              ),
              const SizedBox(height: 16.0),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFF7689DE)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7689DE)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFF7689DE),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFF7689DE)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7689DE)),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Color(0xFF7689DE),
                    ),
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
                      final email = emailController.text;
                      final password = passwordController.text;
                      final isLoggedIn = await loginUser(email, password);
                      if (isLoggedIn) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrincipalScreen(),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        _showAlertDialog(context, 'La cuenta no existe');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50.0),
                      backgroundColor: const Color(0xFF7689DE),
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform account creation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CrearCuenta(),
                        ),
                      );
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
            ],
          ),
        ),
      ),
    );
  }
}

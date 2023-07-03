import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/crear_cuenta.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100.0,left: 16.0,right: 16.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/perro.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
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
              const SizedBox(height: 16.0),
              ButtonTheme(
                minWidth: double.infinity,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
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
                      fixedSize: const Size.fromHeight(5.0),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Crear cuenta'),
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

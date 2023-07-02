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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/perro.png',
                width: 500.0,
                height: 200.0,
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
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const CrearCuenta())
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
    );
  }
}
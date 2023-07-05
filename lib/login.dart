import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/crear_cuenta.dart';
import 'package:pet_rescue_flutter/principal.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
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
              const FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  obscureText: true,
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
                      onPressed: () {
                      // Perform account creation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrincipalScreen(),
                        ),
                      );
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

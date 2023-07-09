import 'package:flutter/material.dart';
import 'package:pet_rescue_flutter/adopcion.dart';
import 'package:pet_rescue_flutter/menu.dart';
import 'package:pet_rescue_flutter/dogs_list.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetRescue'),
        actions: const [
          CustomMenu(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Bienvenido(a)',
                style: TextStyle(
                  color: Color(0xFF7689DE),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/perro.png',
                width: 128.0,
                height: 128.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                '¿Cómo te gustaría ayudar?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Image.asset(
                'assets/amor.png',
                width: 64.0,
                height: 64.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Adopta, salva vidas. Encuentra tu compañero peludo y experimenta el amor incondicional',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: SizedBox(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DogsList(),
                        ),
                      );
                    },
                    child: const Text(
                      'Adoptar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Image.asset(
                'assets/animales.png',
                width: 64.0,
                height: 64.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Dale a tu perro la oportunidad de un hogar amoroso. Considera la adopción y cambia una vida',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: SizedBox(
                  width: 0.9 * MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción a realizar al presionar el botón
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Adopcion(),
                        ),
                      );
                    },
                    child: const Text(
                      'Dar en adopción',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}

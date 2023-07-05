import 'package:flutter/material.dart';

class Adopcion extends StatelessWidget {
  const Adopcion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de mascotas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 32.0),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/perro.png',
                  width: 128,
                  height: 128,
                ),
              ),
              const SizedBox(height: 16.0),
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.pets,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Edad (años o meses)',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.cake,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Raza',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.pets,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tamaño',
                      labelStyle: TextStyle(color: Color(0xFF7689DE)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7689DE)),
                      ),
                      prefixIcon: Icon(
                        Icons.height,
                        color: Color(0xFF7689DE),
                      ),
                    ),
                    value: null,
                    onChanged: (String? newValue) {
                      // Lógica para manejar el cambio de valor seleccionado
                    },
                    items: <String>['Pequeño', 'Mediano', 'Grande']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  '¿Cuál es el género del animal?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Macho',
                        groupValue: null,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                      ),
                      const Text(
                        'Macho',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Hembra',
                        groupValue: null,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                      ),
                      const Text(
                        'Hembra',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '¿Cuenta con estas vacunas?',
                  style: TextStyle(
                    color: Color(0xFF7689DE),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Rabia',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Parvovirus canino',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Moquillo',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Lógica para manejar el cambio de valor seleccionado
                        },
                        activeColor: const Color(0xFF7689DE),
                      ),
                      const Text(
                        'Hepatitis canina',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

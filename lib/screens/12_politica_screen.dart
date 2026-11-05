import 'package:flutter/material.dart';

class PoliticaScreen extends StatelessWidget {
  const PoliticaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Política de privacidad'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text('1. Información que recopilamos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Recopilamos datos personales al registrarte, como nombre, correo y dirección.'),
            SizedBox(height: 15),
            Text('2. Uso de la información', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Tu información se utiliza únicamente para procesar tus pedidos de forma segura.'),
          ],
        ),
      ),
    );
  }
}
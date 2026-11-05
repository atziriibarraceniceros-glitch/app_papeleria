import 'package:flutter/material.dart';

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre nosotros'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Sobre nosotros', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Somos una papelería con diversas ideas con un diseño bonito y a precios accesibles.'),
            SizedBox(height: 20),
            ListTile(leading: Icon(Icons.card_giftcard, color: Colors.pinkAccent), title: Text('Variedad de productos')),
            ListTile(leading: Icon(Icons.person, color: Colors.pinkAccent), title: Text('Atención personalizada')),
          ],
        ),
      ),
    );
  }
}
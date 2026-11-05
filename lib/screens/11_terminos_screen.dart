import 'package:flutter/material.dart';

class TerminosScreen extends StatelessWidget {
  const TerminosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Términos y condiciones'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text('1. Generalidades', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Estos términos regulan el uso de este sitio web y la venta de productos.'),
            SizedBox(height: 15),
            Text('2. Productos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Los precios e imágenes de los productos pueden variar sin previo aviso.'),
          ],
        ),
      ),
    );
  }
}
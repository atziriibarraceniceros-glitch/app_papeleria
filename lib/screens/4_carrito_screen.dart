import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tu carrito'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ListTile(title: Text('Libreta pastel'), subtitle: Text('Cantidad: 1 - \$45')),
                  ListTile(title: Text('Colores'), subtitle: Text('Cantidad: 1 - \$50')),
                ],
              ),
            ),
            const Divider(),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('\$95', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pinkAccent))]),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () => Navigator.pushNamed(context, '/confirmacion'),
                child: const Text('Finalizar compra', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
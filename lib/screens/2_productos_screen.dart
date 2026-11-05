import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Papelería'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Nuestros productos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Buscar productos...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () {}, child: const Text('Todos', style: TextStyle(color: Colors.pinkAccent))),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/categoria'), child: const Text('Libretas')),
              TextButton(onPressed: () {}, child: const Text('Plumas')),
            ],
          ),
          const SizedBox(height: 15),
          // QUITAMOS EL 'const' DE AQUÍ:
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _cardItem(context, 'Mochilas', '\$250', 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300'),
              _cardItem(context, 'Notas adhesivas', '\$35', 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=300'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardItem(BuildContext context, String title, String price, String img) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detalle', arguments: title),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.pink.shade100)),
        child: Column(
          children: [
            Expanded(child: Image.network(img, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(price, style: const TextStyle(color: Colors.pinkAccent))]),
            ),
          ],
        ),
      ),
    );
  }
}
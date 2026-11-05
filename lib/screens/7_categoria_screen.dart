import 'package:flutter/material.dart';

class CategoriaScreen extends StatelessWidget {
  const CategoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Libretas'), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _itemCat(context, 'Libreta pastel', '\$45'),
          _itemCat(context, 'Libreta fucsia', '\$50'),
        ],
      ),
    );
  }

  Widget _itemCat(BuildContext context, String nombre, String precio) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.pink.shade100)),
      child: Column(
        children: [
          Expanded(child: Image.network('https://images.unsplash.com/photo-1544816155-12df9643f363?w=300', fit: BoxFit.cover)),
          Padding(padding: const EdgeInsets.all(8.0), child: Text('$nombre\n$precio', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
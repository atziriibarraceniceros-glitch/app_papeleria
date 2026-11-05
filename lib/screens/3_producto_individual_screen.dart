import 'package:flutter/material.dart';

class ProductoIndividualScreen extends StatelessWidget {
  const ProductoIndividualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as String? ?? 'Libreta pastel';
    return Scaffold(
      appBar: AppBar(title: Text(arg), backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network('https://images.unsplash.com/photo-1544816155-12df9643f363?w=400', height: 200, fit: BoxFit.cover)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(arg, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Text('\$45', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Libreta de 100 hojas, con pasta dura y diseño en tono pastel. Ideal para el día a día.', style: TextStyle(color: Colors.grey)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () => Navigator.pushNamed(context, '/carrito'),
                child: const Text('Agregar al carrito', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
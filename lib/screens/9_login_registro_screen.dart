import 'package:flutter/material.dart';

class LoginRegistroScreen extends StatelessWidget {
  const LoginRegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit, size: 60, color: Colors.pinkAccent),
            const Text('Bienvenido', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Inicia sesión o regístrate', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: 'Correo electrónico', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Contraseña', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () => Navigator.pushReplacementNamed(context, '/inicio'),
                child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
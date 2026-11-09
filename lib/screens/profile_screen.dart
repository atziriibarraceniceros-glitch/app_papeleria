import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mi Perfil',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark),
        ),
        iconTheme: const IconThemeData(color: PastelColors.lavenderPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: PastelColors.lavenderPrimary,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Joselyn Rivas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: PastelColors.textDark),
            ),
            const SizedBox(height: 5),
            const Text(
              'americajosselyn04@gmail.com',
              style: TextStyle(fontSize: 14, color: PastelColors.textMuted),
            ),
            const SizedBox(height: 30),
            // Aquí puedes agregar más campos o información de perfil después
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.badge_outlined, color: PastelColors.lavenderPrimary),
                    title: Text('Rol'),
                    trailing: Text('Administrador', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.store_outlined, color: PastelColors.lavenderPrimary),
                    title: Text('Sucursal Asignada'),
                    trailing: Text('Sucursal Matriz', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Seguridad y Contraseña',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark),
        ),
        iconTheme: const IconThemeData(color: PastelColors.lavenderPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_reset, color: PastelColors.lavenderPrimary),
                    title: const Text('Cambiar contraseña', style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      // Acción para cambiar contraseña
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.security, color: PastelColors.lavenderPrimary),
                    title: const Text('Autenticación de dos factores', style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeColor: PastelColors.lavenderPrimary,
                    ),
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
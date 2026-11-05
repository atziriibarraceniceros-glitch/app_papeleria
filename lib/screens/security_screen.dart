import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  // Variable para guardar el estado real del interruptor de 2FA
  bool dosFactores = false;

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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              'Cambiar Contraseña',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña Actual',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Nueva Contraseña',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Confirmar Nueva Contraseña',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancelar', style: TextStyle(color: PastelColors.textMuted)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Contraseña actualizada con éxito')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: PastelColors.lavenderPrimary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text('Guardar', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.security, color: PastelColors.lavenderPrimary),
                    title: const Text('Autenticación de dos factores', style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Switch(
                      value: dosFactores,
                      onChanged: (bool value) {
                        setState(() {
                          dosFactores = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              value 
                                ? 'Autenticación de dos factores activada' 
                                : 'Autenticación de dos factores desactivada'
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
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
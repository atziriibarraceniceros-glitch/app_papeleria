import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: PastelColors.textDark),
        title: const Text('Procesar Pago', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
      ),
      body: const Center(
        child: Text('Apartado de pago en construcción', style: TextStyle(color: PastelColors.textMuted)),
      ),
    );
  }
}
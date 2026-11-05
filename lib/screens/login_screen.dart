import 'package:flutter/material.dart';
import '../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: PastelColors.lavenderLight,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.menu_book_rounded, size: 38, color: PastelColors.lavenderPrimary),
                ),
                const SizedBox(height: 16),
                const Text(
                  'PAPELNOVA',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 1.2, color: PastelColors.textDark),
                ),
                const SizedBox(height: 4),
                const Text(
                  'SISTEMA DE INVENTARIO & PUNTO DE VENTA',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1, color: PastelColors.lavenderPrimary),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: PastelColors.surfaceCard,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '¡Bienvenido de nuevo!',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: PastelColors.textDark),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Ingresa tus credenciales para acceder al catálogo y administración.',
                        style: TextStyle(fontSize: 13, color: PastelColors.textMuted),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(label: 'Usuario o Correo', hint: 'ej. usuario@papelnova.com', icon: Icons.alternate_email),
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: 'Contraseña',
                        hint: '••••••••••••',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        obscureText: _obscureText,
                        onTogglePassword: () => setState(() => _obscureText = !_obscureText),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            activeColor: PastelColors.lavenderPrimary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            onChanged: (val) => setState(() => _rememberMe = val ?? false),
                          ),
                          const Text('Recordar sesión', style: TextStyle(fontSize: 13, color: PastelColors.textMuted)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PastelColors.lavenderPrimary,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 52),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Iniciar Sesión', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
        const SizedBox(height: 6),
        TextField(
          obscureText: isPassword && obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, color: PastelColors.textMuted),
            prefixIcon: Icon(icon, color: PastelColors.lavenderPrimary, size: 20),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: PastelColors.textMuted, size: 20),
                    onPressed: onTogglePassword,
                  )
                : null,
            filled: true,
            fillColor: PastelColors.surfaceSubtle,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
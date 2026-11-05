import '../screens/profile_screen.dart';
import '../screens/security_screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/notifications_screen.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Perfil de Usuario',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PastelColors.textDark,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: PastelColors.textMuted),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: PastelColors.lavenderLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 38,
                          backgroundColor: PastelColors.lavenderPrimary,
                          child: Icon(Icons.person, size: 44, color: Colors.white),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: PastelColors.mintSuccess,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Joselyn Rivas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'americajosselyn04@gmail.com',
                      style: TextStyle(fontSize: 13, color: PastelColors.textMuted),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildBadge('Administrador', PastelColors.lavenderLight, PastelColors.lavenderPrimary),
                        const SizedBox(width: 8),
                        _buildBadge('Sucursal Matriz', PastelColors.peachLight, PastelColors.peachWarning),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // 1. MI PERFIL
              _buildDrawerOption(Icons.person_outline, 'Mi Perfil', () {
                Navigator.pop(context); // Cierra el menú lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              }),

             // 2. SEGURIDAD Y CONTRASEÑA
              _buildDrawerOption(Icons.lock_outline, 'Seguridad y Contraseña', () {
                Navigator.pop(context); // Cierra el menú lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecurityScreen()),
                );
              }),

              // 3. NOTIFICACIONES Y ALERTAS
              _buildDrawerOption(
               Icons.notifications_none, 
               'Notificaciones y Alertas', 
                () {
              Navigator.pop(context);
              Navigator.push(
               context,
              MaterialPageRoute(builder: (context) => const NotificationsScreen()),
    );
  },
),
             
              
              // 4. CERRAR SESIÓN
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: const Icon(Icons.logout, color: PastelColors.coralDanger),
                label: const Text('Cerrar Sesión', style: TextStyle(color: PastelColors.coralDanger, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PastelColors.coralLight,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: textCol)),
    );
  }

  Widget _buildDrawerOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: PastelColors.lavenderPrimary),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: PastelColors.textDark)),
      trailing: const Icon(Icons.chevron_right, size: 18, color: PastelColors.textMuted),
      onTap: onTap,
    );
  }
}
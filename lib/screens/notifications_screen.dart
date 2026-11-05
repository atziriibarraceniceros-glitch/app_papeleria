import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Variables para guardar el estado de cada interruptor
  bool nuevosPedidos = true;
  bool actualizacionesEntrega = true;
  bool promociones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notificaciones y Alertas',
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
                    leading: const Icon(Icons.shopping_bag, color: PastelColors.lavenderPrimary),
                    title: const Text('Nuevos pedidos', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('Recibir alertas cuando se registre un pedido', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: Switch(
                      value: nuevosPedidos,
                      onChanged: (bool value) {
                        setState(() {
                          nuevosPedidos = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              value 
                                ? 'Alertas de nuevos pedidos activadas' 
                                : 'Alertas de nuevos pedidos desactivadas'
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      activeColor: PastelColors.lavenderPrimary,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.local_shipping, color: PastelColors.lavenderPrimary),
                    title: const Text('Actualizaciones de entrega', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('Avisos sobre el estado del reparto', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: Switch(
                      value: actualizacionesEntrega,
                      onChanged: (bool value) {
                        setState(() {
                          actualizacionesEntrega = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              value 
                                ? 'Actualizaciones de entrega activadas' 
                                : 'Actualizaciones de entrega desactivadas'
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      activeColor: PastelColors.lavenderPrimary,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.campaign, color: PastelColors.lavenderPrimary),
                    title: const Text('Promociones y avisos', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('Anuncios importantes del sistema', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: Switch(
                      value: promociones,
                      onChanged: (bool value) {
                        setState(() {
                          promociones = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              value 
                                ? 'Promociones activadas' 
                                : 'Promociones desactivadas'
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
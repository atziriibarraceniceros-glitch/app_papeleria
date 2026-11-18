import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/profile_drawer.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {

  final bool _isAdmin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      endDrawer: const ProfileDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PAPELNOVA',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: PastelColors.lavenderPrimary,
              ),
            ),
            Text(
              'Inventario',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PastelColors.textDark,
              ),
            ),
          ],
        ),

        actions: [
          if (_isAdmin)
            IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: PastelColors.lavenderPrimary,
              ),
              tooltip: 'Agregar Producto',
              onPressed: () {
                Navigator.pushNamed(context, '/create_product');
              },
            ),

          Builder(
            builder: (ctx) => InkWell(
              onTap: () => Scaffold.of(ctx).openEndDrawer(),
              child: const Padding(
                padding: EdgeInsets.only(right: 16, left: 4),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: PastelColors.lavenderLight,
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: PastelColors.lavenderPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TARJETAS DE INVENTARIO SIN NÚMEROS

            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    'TOTAL CATÁLOGO',
                    'Productos activos',
                    PastelColors.lavenderLight,
                    PastelColors.lavenderPrimary,
                    Icons.inventory_2_outlined,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildKpiCard(
                    'VALOR TOTAL',
                    'En stock tienda',
                    PastelColors.mintLight,
                    PastelColors.mintSuccess,
                    Icons.payments_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    'BAJO STOCK',
                    'Revisar',
                    PastelColors.peachLight,
                    PastelColors.peachWarning,
                    Icons.warning_amber_rounded,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildKpiCard(
                    'AGOTADOS',
                    'Crítico',
                    PastelColors.coralLight,
                    PastelColors.coralDanger,
                    Icons.remove_shopping_cart_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // BUSCADOR

            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por producto, marca o SKU...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: PastelColors.textMuted,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // INVENTARIO VACÍO

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [

                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: PastelColors.lavenderLight,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.inventory_2_outlined,
                        size: 48,
                        color: PastelColors.lavenderPrimary,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Inventario vacío',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: PastelColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Aún no hay productos registrados. '
                      'Cuando conectemos la base de datos, '
                      'los productos aparecerán aquí.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: PastelColors.textMuted,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 28),

                    if (_isAdmin)
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/create_product',
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Agregar producto'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              PastelColors.lavenderPrimary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TARJETAS KPI SIN CANTIDADES

  Widget _buildKpiCard(
    String label,
    String subtext,
    Color bg,
    Color iconColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ),
              Icon(
                icon,
                size: 18,
                color: iconColor,
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            subtext,
            style: TextStyle(
              fontSize: 11,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
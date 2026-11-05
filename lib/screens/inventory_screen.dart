import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/profile_drawer.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

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
            Text('PAPELNOVA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: PastelColors.lavenderPrimary)),
            Text('Inventario', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: PastelColors.lavenderPrimary),
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
                  child: Icon(Icons.person, size: 20, color: PastelColors.lavenderPrimary),
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
            Row(
              children: [
                Expanded(child: _buildKpiCard('TOTAL CATÁLOGO', '148', 'Productos activos', PastelColors.lavenderLight, PastelColors.lavenderPrimary, Icons.inventory_2_outlined)),
                const SizedBox(width: 12),
                Expanded(child: _buildKpiCard('VALOR TOTAL', '\$14,250', 'En stock tienda', PastelColors.mintLight, PastelColors.mintSuccess, Icons.payments_outlined)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildKpiCard('BAJO STOCK', '5', 'Revisar', PastelColors.peachLight, PastelColors.peachWarning, Icons.warning_amber_rounded)),
                const SizedBox(width: 12),
                Expanded(child: _buildKpiCard('AGOTADOS', '2', 'Crítico', PastelColors.coralLight, PastelColors.coralDanger, Icons.remove_shopping_cart_outlined)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por producto, marca o SKU...',
                prefixIcon: const Icon(Icons.search, color: PastelColors.textMuted),
                suffixIcon: IconButton(icon: const Icon(Icons.qr_code_scanner, color: PastelColors.lavenderPrimary), onPressed: () {}),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Todos (148)', true),
                  _buildCategoryChip('Cuadernos (36)', false),
                  _buildCategoryChip('Lápices y Plumas (42)', false),
                  _buildCategoryChip('Colores (28)', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('CUADERNOS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
            const SizedBox(height: 10),
            _buildProductCard('Cuaderno Profesional Espiral Doble Cuadro 100 Hojas', 'SKU-CD-101', '\$48.50', '35 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess),
            _buildProductCard('Libreta Pasta Dura Punteada Bullet Journal A5', 'SKU-BJ-442', '\$165.00', '¡Pocas existencias! (4 u.)', PastelColors.peachLight, PastelColors.peachWarning),
            _buildProductCard('Cuaderno Francés Cosido Raya 96 Hojas', 'SKU-CF-089', '\$38.00', '0 u. Agotado', PastelColors.coralLight, PastelColors.coralDanger),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiCard(String label, String value, String subtext, Color bg, Color iconColor, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: iconColor)),
              Icon(icon, size: 18, color: iconColor),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
          const SizedBox(height: 4),
          Text(subtext, style: TextStyle(fontSize: 11, color: iconColor)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String title, bool active) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        backgroundColor: active ? PastelColors.lavenderPrimary : Colors.white,
        label: Text(title, style: TextStyle(color: active ? Colors.white : PastelColors.textDark, fontSize: 12, fontWeight: FontWeight.w600)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
      ),
    );
  }

  Widget _buildProductCard(String title, String sku, String price, String stock, Color badgeBg, Color badgeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(color: PastelColors.surfaceSubtle, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.menu_book, color: PastelColors.lavenderPrimary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sku, style: const TextStyle(fontSize: 11, color: PastelColors.textMuted)),
                const SizedBox(height: 2),
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: PastelColors.lavenderPrimary)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(12)),
                      child: Text(stock, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: badgeColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/profile_drawer.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  String _selectedCategory = 'Todos';
  
  // Filtro para las tarjetas de estado (KPIs)
  // Valores: 'todos', 'bajo_stock', 'agotados'
  String _statusFilter = 'todos';

  final bool _isAdmin = true; // Cambiar a false si es empleado normal

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
          if (_isAdmin)
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
            // TARJETAS KPI INTERACTIVAS (Morada, Verde, Naranja, Rosa)
            Row(
              children: [
                Expanded(
                  child: _buildKpiCard(
                    'TOTAL CATÁLOGO', 
                    '148', 
                    'Productos activos', 
                    PastelColors.lavenderLight, 
                    PastelColors.lavenderPrimary, 
                    Icons.inventory_2_outlined,
                    onTap: () => setState(() => _statusFilter = 'todos'),
                    isSelected: _statusFilter == 'todos',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  // TARJETA VERDE CON FUNCIONALIDAD (Abre resumen financiero)
                  child: _buildKpiCard(
                    'VALOR TOTAL', 
                    '\$14,250', 
                    'En stock tienda', 
                    PastelColors.mintLight, 
                    PastelColors.mintSuccess, 
                    Icons.payments_outlined,
                    onTap: () => _showFinancialSummary(context),
                    isSelected: false,
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
                    '5', 
                    'Revisar', 
                    PastelColors.peachLight, 
                    PastelColors.peachWarning, 
                    Icons.warning_amber_rounded,
                    onTap: () => setState(() => _statusFilter = 'bajo_stock'),
                    isSelected: _statusFilter == 'bajo_stock',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildKpiCard(
                    'AGOTADOS', 
                    '2', 
                    'Crítico', 
                    PastelColors.coralLight, 
                    PastelColors.coralDanger, 
                    Icons.remove_shopping_cart_outlined,
                    onTap: () => setState(() => _statusFilter = 'agotados'),
                    isSelected: _statusFilter == 'agotados',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por producto, marca o SKU...',
                prefixIcon: const Icon(Icons.search, color: PastelColors.textMuted),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            
            // Chips de categorías
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Todos (148)', 'Todos'),
                  _buildCategoryChip('Cuadernos (36)', 'Cuadernos'),
                  _buildCategoryChip('Lápices y Plumas (42)', 'Lápices y Plumas'),
                  _buildCategoryChip('Colores (28)', 'Colores'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // PRODUCTOS FILTRADOS
            ..._buildFilteredProducts(),
          ],
        ),
      ),
    );
  }

  // FUNCIÓN PARA MOSTRAR EL RESUMEN FINANCIERO AL PRESIONAR LA TARJETA VERDE
  void _showFinancialSummary(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.payments_outlined, color: PastelColors.mintSuccess),
            SizedBox(width: 8),
            Text('Valor Financiero', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Desglose del capital invertido en inventario:', style: TextStyle(fontSize: 13, color: PastelColors.textMuted)),
            SizedBox(height: 16),
            _FinancialRow(label: 'Costo total de adquisición:', amount: '\$9,800.00'),
            SizedBox(height: 8),
            _FinancialRow(label: 'Valor de venta estimado:', amount: '\$14,250.00'),
            SizedBox(height: 8),
            _FinancialRow(label: 'Ganancia potencial proyectada:', amount: '\$4,450.00', isProfit: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cerrar', style: TextStyle(color: PastelColors.lavenderPrimary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilteredProducts() {
    List<Widget> widgets = [];

    if (_selectedCategory == 'Todos' || _selectedCategory == 'Cuadernos') {
      List<Widget> cuadernoCards = [];
      if (_statusFilter == 'todos' || _statusFilter == 'normal') {
        cuadernoCards.add(_buildProductCard('Cuaderno Profesional Espiral Doble Cuadro 100 Hojas', 'SKU-CD-101', '\$48.50', '35 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess));
      }
      if (_statusFilter == 'todos' || _statusFilter == 'bajo_stock') {
        cuadernoCards.add(_buildProductCard('Libreta Pasta Dura Punteada Bullet Journal A5', 'SKU-BJ-442', '\$165.00', '¡Pocas existencias! (4 u.)', PastelColors.peachLight, PastelColors.peachWarning));
      }
      if (_statusFilter == 'todos' || _statusFilter == 'agotados') {
        cuadernoCards.add(_buildProductCard('Cuaderno Francés Cosido Raya 96 Hojas', 'SKU-CF-089', '\$38.00', '0 u. Agotado', PastelColors.coralLight, PastelColors.coralDanger));
      }
      if (cuadernoCards.isNotEmpty) {
        widgets.add(const Text('CUADERNOS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PastelColors.textDark)));
        widgets.add(const SizedBox(height: 10));
        widgets.addAll(cuadernoCards);
        widgets.add(const SizedBox(height: 16));
      }
    }

    if (_selectedCategory == 'Todos' || _selectedCategory == 'Lápices y Plumas') {
      List<Widget> lapizCards = [];
      if (_statusFilter == 'todos' || _statusFilter == 'normal') {
        lapizCards.add(_buildProductCard('Bolígrafo Gel Retráctil 0.7mm Negro Pack', 'SKU-BOL-GEL07', '\$66.00', '18 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess));
        lapizCards.add(_buildProductCard('Lápiz de Grafito Mirado #2 Paquete 12 pzs', 'SKU-LAP-MIR2', '\$45.00', '22 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess));
      }
      if (lapizCards.isNotEmpty && _statusFilter != 'bajo_stock' && _statusFilter != 'agotados') {
        widgets.add(const Text('LÁPICES Y PLUMAS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PastelColors.textDark)));
        widgets.add(const SizedBox(height: 10));
        widgets.addAll(lapizCards);
        widgets.add(const SizedBox(height: 16));
      }
    }

    if (_selectedCategory == 'Todos' || _selectedCategory == 'Colores') {
      List<Widget> colorCards = [];
      if (_statusFilter == 'todos' || _statusFilter == 'normal') {
        colorCards.add(_buildProductCard('Colores de Madera Prismacolor Junior 24 Pzs', 'SKU-COL-PRI24', '\$185.00', '12 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess));
        colorCards.add(_buildProductCard('Marcadores Resaltadores Pastel Set 6 pzs', 'SKU-RES-PAS06', '\$98.00', '8 u. En Stock', PastelColors.mintLight, PastelColors.mintSuccess));
      }
      if (colorCards.isNotEmpty && _statusFilter != 'bajo_stock' && _statusFilter != 'agotados') {
        widgets.add(const Text('COLORES', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PastelColors.textDark)));
        widgets.add(const SizedBox(height: 10));
        widgets.addAll(colorCards);
      }
    }

    if (widgets.isEmpty) {
      widgets.add(
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Text('No hay productos que coincidan con este filtro.', style: TextStyle(color: PastelColors.textMuted)),
          ),
        ),
      );
    }

    return widgets;
  }

  Widget _buildKpiCard(String label, String value, String subtext, Color bg, Color iconColor, IconData icon, {required VoidCallback onTap, required bool isSelected}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bg, 
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? iconColor : Colors.transparent,
              width: 2,
            ),
          ),
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
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String title, String categoryKey) {
    final bool active = _selectedCategory == categoryKey;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(
        backgroundColor: active ? PastelColors.lavenderPrimary : Colors.white,
        label: Text(
          title,
          style: TextStyle(
            color: active ? Colors.white : PastelColors.textDark,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none,
        ),
        onPressed: () {
          setState(() {
            _selectedCategory = categoryKey;
          });
        },
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

// Widget auxiliar para las filas del diálogo financiero
class _FinancialRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isProfit;

  const _FinancialRow({Key? key, required this.label, required this.amount, this.isProfit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: PastelColors.textMuted)),
        Text(
          amount, 
          style: TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold, 
            color: isProfit ? PastelColors.mintSuccess : PastelColors.textDark,
          ),
        ),
      ],
    );
  }
}
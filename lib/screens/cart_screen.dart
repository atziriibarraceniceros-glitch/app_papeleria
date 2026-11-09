import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/profile_drawer.dart';
import 'checkout_screen.dart'; // <-- Asegúrate de importar la pantalla de pago

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Lista mutable con tipo inferido automáticamente
  final _cartItems = [
    {
      'name': 'Cuaderno Profesional Rayas 100 Hojas',
      'sku': 'SKU: CDN-100R',
      'subtotal': '\$97.00',
      'qty': 'Cant: 2',
    },
    {
      'name': 'Bolígrafo Gel Retráctil 0.7mm Negro Pack',
      'sku': 'SKU: BOL-GEL07',
      'subtotal': '\$66.00',
      'qty': 'Cant: 3',
    },
    {
      'name': 'Marcadores Resaltadores Pastel Set 6 pzs',
      'sku': 'SKU: RES-PAS06',
      'subtotal': '\$98.00',
      'qty': 'Cant: 1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      endDrawer: const ProfileDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Carrito de Compras', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
        actions: [
          Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.person, color: PastelColors.lavenderPrimary),
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: PastelColors.mintLight, borderRadius: BorderRadius.circular(16)),
              child: const Row(
                children: [
                  Icon(Icons.local_shipping_outlined, color: PastelColors.mintSuccess),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text('ENVÍO LOCAL GRATUITO en compras mayores a \$250', 
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: PastelColors.mintSuccess)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // SI LA LISTA ESTÁ VACÍA, MUESTRA UN MENSAJE
            if (_cartItems.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text('El carrito está vacío', style: TextStyle(fontSize: 14, color: PastelColors.textMuted, fontWeight: FontWeight.bold)),
                ),
              )
            else
              // DIBUJA CADA PRODUCTO DE LA LISTA DINÁMICAMENTE
              ..._cartItems.map((item) => _buildCartItem(
                    item['name']!,
                    item['sku']!,
                    item['subtotal']!,
                    item['qty']!,
                  )),

            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  _buildSummaryRow('Subtotal', _cartItems.isEmpty ? '\$0.00' : '\$261.00'),
                  const SizedBox(height: 8),
                  _buildSummaryRow('IVA (16%)', _cartItems.isEmpty ? '\$0.00' : '\$41.76'),
                  const SizedBox(height: 8),
                  _buildSummaryRow('Descuento de Temporada (-5%)', _cartItems.isEmpty ? '\$0.00' : '-\$13.05', textColor: PastelColors.mintSuccess),
                  const Divider(height: 24),
                  _buildSummaryRow('Total a Pagar', _cartItems.isEmpty ? '\$0.00' : '\$289.71', isTotal: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B7CF6), Color(0xFFEC4899)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B7CF6).withValues(alpha: 0.35), // <-- Corregido aquí
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _cartItems.isEmpty ? null : () async {
                  final pagado = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );
                  if (pagado == true) {
                    setState(() {
                      _cartItems.clear();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text('Procesar Pago', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),      
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String sku, String subtotal, String qty) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: PastelColors.surfaceSubtle, borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.bookmark_outline, color: PastelColors.lavenderPrimary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sku, style: const TextStyle(fontSize: 11, color: PastelColors.textMuted)),
                    Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(subtotal, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PastelColors.lavenderPrimary)),
                        Text(qty, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: PastelColors.textMuted)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              // ACCIÓN DE ELIMINAR EL PRODUCTO EN TIEMPO REAL
              setState(() {
                _cartItems.removeWhere((item) => item['name'] == name);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Se eliminó "$name" del carrito')),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(color: PastelColors.coralLight, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete_outline, size: 16, color: PastelColors.coralDanger),
                  SizedBox(width: 6),
                  Text('Eliminar producto', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: PastelColors.coralDanger)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false, Color? textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: isTotal ? 16 : 13, fontWeight: isTotal ? FontWeight.bold : FontWeight.w500, color: isTotal ? PastelColors.textDark : PastelColors.textMuted)),
        Text(value, style: TextStyle(fontSize: isTotal ? 20 : 13, fontWeight: FontWeight.bold, color: textColor ?? (isTotal ? PastelColors.lavenderPrimary : PastelColors.textDark))),
      ],
    );
  }
}
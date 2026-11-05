import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/profile_drawer.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  int _initialStock = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      endDrawer: const ProfileDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: PastelColors.textDark),
        title: const Text('Registrar Nuevo Producto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
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
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: PastelColors.lavenderLight, width: 2),
              ),
              child: Column(
                children: [
                  const Icon(Icons.add_photo_alternate_outlined, size: 40, color: PastelColors.lavenderPrimary),
                  const SizedBox(height: 8),
                  const Text('Subir imagen del producto', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
                  const SizedBox(height: 4),
                  const Text('PNG o JPG hasta 5MB. Fondo claro recomendado.', style: TextStyle(fontSize: 12, color: PastelColors.textMuted)),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, size: 16), label: const Text('Tomar Foto')),
                      const SizedBox(width: 10),
                      OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.photo_library_outlined, size: 16), label: const Text('Galería')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildInputCard('Nombre del producto *', 'Ej. Cuaderno Profesional Raya 100 Hojas'),
            const SizedBox(height: 12),
            _buildInputCard('Categoría *', 'Selecciona una categoría de catálogo'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Stock inicial', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: PastelColors.lavenderPrimary),
                        onPressed: () => setState(() => _initialStock = (_initialStock > 0) ? _initialStock - 1 : 0),
                      ),
                      Text('$_initialStock', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: PastelColors.lavenderPrimary),
                        onPressed: () => setState(() => _initialStock++),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('¡Producto registrado con éxito!')),
                );
              },
              icon: const Icon(Icons.check, color: Colors.white),
              label: const Text('Agregar producto', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: PastelColors.lavenderPrimary,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard(String label, String hint) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: PastelColors.textDark)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 13, color: PastelColors.textMuted),
              filled: true,
              fillColor: PastelColors.surfaceSubtle,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
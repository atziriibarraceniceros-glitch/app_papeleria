import 'package:flutter/material.dart';
import 'screens/1_inicio_portada_screen.dart';
import 'screens/2_productos_screen.dart';
import 'screens/3_producto_individual_screen.dart';
import 'screens/4_carrito_screen.dart';
import 'screens/5_nosotros_screen.dart';
import 'screens/6_contacto_screen.dart';
import 'screens/7_categoria_screen.dart';
import 'screens/8_busqueda_screen.dart';
import 'screens/9_login_registro_screen.dart';
import 'screens/10_confirmacion_screen.dart';
import 'screens/11_terminos_screen.dart';
import 'screens/12_politica_screen.dart';

void main() {
  runApp(const PapeleriaApp());
}

class PapeleriaApp extends StatelessWidget {
  const PapeleriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Papelería App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFAF7F8),
      ),
      initialRoute: '/login', // Pantalla 9 por defecto
      routes: {
        '/login': (context) => const LoginRegistroScreen(),       // 9
        '/inicio': (context) => const InicioPortadaScreen(),      // 1
        '/productos': (context) => const ProductosScreen(),       // 2
        '/detalle': (context) => const ProductoIndividualScreen(),// 3
        '/carrito': (context) => const CarritoScreen(),           // 4
        '/nosotros': (context) => const NosotrosScreen(),         // 5
        '/contacto': (context) => const ContactoScreen(),         // 6
        '/categoria': (context) => const CategoriaScreen(),       // 7
        '/busqueda': (context) => const BusquedaScreen(),         // 8
        '/confirmacion': (context) => const ConfirmacionScreen(), // 10
        '/terminos': (context) => const TerminosScreen(),         // 11
        '/politica': (context) => const PoliticaScreen(),         // 12
      },
    );
  }
}
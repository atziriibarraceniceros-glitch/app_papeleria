import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'inventory_screen.dart';
import 'cart_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const InventoryScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: PastelColors.lavenderPrimary,
        unselectedItemColor: PastelColors.textMuted,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_rounded), label: 'Inventario'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Carrito'),
        ],
      ),
    );
  }
}
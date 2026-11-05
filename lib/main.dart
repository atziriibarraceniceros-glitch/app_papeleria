import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/create_product_screen.dart';

void main() => runApp(const PapelnovaApp());

class PapelnovaApp extends StatelessWidget {
  const PapelnovaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAPELNOVA POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: PastelColors.background,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainNavigationScreen(),
        '/create_product': (context) => const CreateProductScreen(),
      },
    );
  }
}
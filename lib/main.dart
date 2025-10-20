import 'package:flutter/material.dart';
import 'screens/mybag_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/success_screen.dart'; // ✅ Import Success Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goofy Street',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyBagScreen(),
        '/checkout': (context) => const CheckoutScreen(totalAmount: 124),
        '/success': (context) => const SuccessScreen(), // ✅ Added route
      },
    );
  }
}

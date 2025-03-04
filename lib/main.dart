import 'package:animations/core/providers/cart_provider.dart';
import 'package:animations/core/screens/cart/cart_screen.dart';
import 'package:animations/core/screens/cart/checkout_screen.dart';
import 'package:animations/core/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute : '/',
      routes: {
        '/' : (context) =>const Home(),
        '/cart': (context) =>const ShowCart(),
        '/checkout': (context) => const CheckoutPage()
      },
    );
  }
}

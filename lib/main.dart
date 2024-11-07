import 'package:flutter/material.dart';
import 'package:PortfolioF/home/home.dart';

void main() {
  runApp(const PortfolioF());
}

class PortfolioF extends StatelessWidget {
  const PortfolioF({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

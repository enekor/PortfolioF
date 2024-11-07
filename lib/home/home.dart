import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:PortfolioF/widgets/PortfolioButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<String> words = [
    "Hola",
    "Hola",
    "Mi nombre es Eneko",
    "Déjame presentarme",
    "inicio"
  ];
  int currentIndex = 0;
  bool isVisible = false;
  late AnimationController _controller;

  void onProjects() {
    print("Projects");
  }

  void onProfile() {
    print("Profile");
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex < words.length - 1) {
        setState(() {
          isVisible = false; // Ocultar la palabra actual
        });
        Future.delayed(Duration(milliseconds: 1000), () {
          setState(() {
            currentIndex++; // Cambiar a la siguiente palabra
            isVisible = true; // Mostrar la nueva palabra
          });
          _controller.forward(from: 0);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 245, 245),
      body: Center(
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 1), // Comienza desde abajo
              end: Offset(0, 0), // Termina en su posición original
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeIn,
            )),
            child: words[currentIndex] != "inicio"
                ? Text(
                    words[currentIndex],
                    style: TextStyle(fontSize: 24),
                  )
                : portfolioStart(),
          ),
        ),
      ),
    );
  }

  Widget portfolioStart() {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 245, 245),
      body: Stack(
        children: [
          const Positioned(
            left: 100,
            right: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Eneko Rebollo Hernandez",
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  "Developer",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Positioned(
            left: -30,
            bottom: -30,
            child: Transform.rotate(
              angle: 20 * (3.14159 / 180),
              child: Lottie.network(
                'https://lottie.host/936c29c6-55be-49bc-a579-084eb85fbe27/Kpnkfc8aA1.json',
                width: 300, // Ajusta el tamaño según sea necesario
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Aquí puedes agregar otros widgets que ocupen toda la pantalla
          Container(
            color: Colors.transparent,
            child: Center(
                child: Wrap(
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                PortfolioButton(
                  title: "Sobre mi",
                  subtitle: "Mi curriculum de forma mas visual",
                  onClick: onProfile,
                ),
                PortfolioButton(
                  title: "Mis proyectos",
                  subtitle: "Listado de los proyectos que estan en mi github",
                  onClick: onProjects,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

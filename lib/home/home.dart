import 'package:PortfolioF/paint/backgroundPainter.dart';
import 'package:PortfolioF/widgets/Shapes.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:PortfolioF/widgets/PortfolioButton.dart';
/*
Color Base:
Cian Claro: Color.fromARGB(255, 238, 245, 245)
Colores Complementarios:
Cian: Color.fromARGB(255, 0, 188, 212) (un tono más intenso)
Verde Menta: Color.fromARGB(255, 178, 255, 189) (un verde suave)
Gris Claro: Color.fromARGB(255, 200, 200, 200) (para un contraste sutil)
Coral Suave: Color.fromARGB(255, 255, 183, 177) (un toque cálido)
Colores de Acento:
Azul Marino: Color.fromARGB(255, 25, 118, 210) (para un contraste más fuerte)
Lavanda: Color.fromARGB(255, 200, 160, 255) (un tono suave y relajante)
*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<String> words = [
    "Hola",
    // "Hola",
    // "Mi nombre es Eneko",
    // "Déjame presentarme",
    "inicio"
  ];
  int currentIndex = 0;
  bool isVisible = false;
  String hoverAnimation =
      "https://lottie.host/f6da9843-082e-442e-9639-3a4c7f640eed/TzvvouHVnF.json";
  double angle = 0;
  late AnimationController _controller;

  void onProjects() {
    print("Projects");
  }

  void onProfile() {
    print("Profile");
  }

  void onHoverButton(String fondo, bool isHovered) {
    if (isHovered) {
      switch (fondo) {
        case "me":
          hoverAnimation =
              "https://lottie.host/e5b9144d-908f-479b-9738-14ec82482c5a/bNmBeTz9Pb.json";
          break;

        case "projects":
          hoverAnimation =
              "https://lottie.host/a16cd47c-055a-40c8-942f-048e22f04857/wlmr1XR3f6.json";
          break;

        default:
      }
    } else {
      hoverAnimation =
          "https://lottie.host/f6da9843-082e-442e-9639-3a4c7f640eed/TzvvouHVnF.json";
    }

    setState(() {});
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

    Timer.periodic(Duration(milliseconds: 1), (timer) {
      angle += 0.005;
      setState(() {});
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
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: Stack(
          children: [
            Positioned(
              left: -20,
              top: 400,
              child: Transform.rotate(
                angle: angle * -1,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: ShapeDecoration(
                      shape: PortfolioStar(10, 25, 25, 25),
                      color: Color.fromARGB(255, 178, 255, 189)),
                ),
              ),
            ),
            const Positioned(
              left: 100,
              right: 100,
              child: Text(
                "Eneko Rebollo Hernández",
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              right: -110,
              bottom: -120,
              child: Transform.rotate(
                angle: angle,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: ShapeDecoration(
                      shape: PortfolioPoligon(10, 25),
                      color: Color.fromARGB(255, 25, 118, 210)),
                ),
              ),
            ),
            Positioned(
              right: -50,
              bottom: -50,
              child: Transform.rotate(
                angle: angle + 0.4,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: ShapeDecoration(
                      shape: PortfolioPoligon(10, 25),
                      color: Color.fromARGB(255, 200, 160, 255)),
                ),
              ),
            ),

            // Aquí puedes agregar otros widgets que ocupen toda la pantalla
            Container(
              color: Colors.transparent,
              child: Center(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Lottie.network(
                        hoverAnimation,
                        key: ValueKey<String>(hoverAnimation),
                        width: 500,
                        height: 500,
                        reverse: false,
                        repeat: true,
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      PortfolioButton(
                        title: "Sobre mi",
                        subtitle: "Mi curriculum de forma mas visual",
                        onClick: onProfile,
                        onHover: (isHovered) => onHoverButton("me", isHovered),
                      ),
                      PortfolioButton(
                        title: "Mis proyectos",
                        subtitle:
                            "Listado de los proyectos que estan en mi github",
                        onClick: onProjects,
                        onHover: (isHovered) =>
                            onHoverButton("projects", isHovered),
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';

typedef HoverCallBack = void Function(bool isHovered);

class PortfolioButton extends StatefulWidget {
  final String title; // Título del botón
  final String subtitle; // Subtítulo que aparecerá al pasar el ratón
  final VoidCallback onClick; // Acción al hacer clic
  final HoverCallBack onHover; // Acción al pasar el ratón

  // Constructor que recibe el título, el subtítulo y la acción al hacer clic
  const PortfolioButton(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onClick,
      required this.onHover})
      : super(key: key);

  @override
  _PortfolioButtonState createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
        widget.onHover(true);
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
        widget.onHover(false);
      }),
      child: GestureDetector(
        onTap: widget.onClick, // Acción al hacer clic
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              width: 200, // Ancho específico del botón
              height: 100, // Alto específico del botón
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 238, 245, 245), // Color del botón y del fondo
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                            color: Colors.grey.shade500, // Sombra más oscura
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            inset: true),
                        const BoxShadow(
                            color: Colors.white, // Sombra más clara
                            offset: Offset(-4, -4),
                            blurRadius: 0,
                            inset: true),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.grey.shade500, // Sombra más oscura
                          offset: Offset(4, 4),
                          blurRadius: 0,
                        ),
                        const BoxShadow(
                          color: Colors.white, // Sombra más clara
                          offset: Offset(-4, -4),
                          blurRadius: 0,
                        ),
                      ],
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    widget.title, // Usar el título pasado como parámetro
                    style: TextStyle(color: Colors.black, fontSize: 24),
                    maxLines: 1, // Número máximo de líneas
                    minFontSize: 12, // Tamaño mínimo de la fuente
                    overflow: TextOverflow
                        .ellipsis, // Añadir puntos suspensivos si el texto es muy largo
                  ),
                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: AutoSizeText(
                      widget
                          .subtitle, // Usar el subtítulo pasado como parámetro
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      maxLines: 1, // Número máximo de líneas
                      minFontSize: 12, // Tamaño mínimo de la fuente
                      overflow: TextOverflow
                          .ellipsis, // Añadir puntos suspensivos si el texto es muy largo
                    ),
                  ),
                ],
              ),
            ),
            if (_isHovered)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Lottie.network(
                        "https://lottie.host/9a1dfeff-aae4-4916-9652-4772310b491e/ZqzP1w0V1S.json",
                        reverse: true,
                        repeat: false),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

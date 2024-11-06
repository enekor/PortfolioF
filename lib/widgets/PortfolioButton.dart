import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PortfolioButton extends StatefulWidget {
  final String title; // Título del botón
  final String subtitle; // Subtítulo que aparecerá al pasar el ratón

  // Constructor que recibe el título y el subtítulo
  const PortfolioButton({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _PortfolioButtonState createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blueAccent : Colors.blue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title, // Usar el título pasado como parámetro
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Text(
                widget.subtitle, // Usar el subtítulo pasado como parámetro
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

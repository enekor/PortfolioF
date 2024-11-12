import 'package:flutter/material.dart';

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBlue = Paint()..color = Color.fromARGB(255, 238, 245, 245);
    final paintOrange = Paint()..color = Colors.cyan;

    // Dibuja la parte azul
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paintBlue);

    // Dibuja la parte naranja
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paintOrange);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

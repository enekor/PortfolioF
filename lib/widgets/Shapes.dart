import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

PolygonShapeBorder PortfolioPoligon(int sides, int cornerRadius) {
  return PolygonShapeBorder(
      sides: sides,
      cornerRadius: cornerRadius.toPercentLength,
      cornerStyle: CornerStyle.rounded);
}

StarShapeBorder PortfolioStar(
    int corners, int inset, double cornerRadius, double insetRadius) {
  return StarShapeBorder(
      corners: corners,
      inset: inset.toPercentLength,
      cornerRadius: cornerRadius.toPXLength,
      cornerStyle: CornerStyle.rounded,
      insetRadius: insetRadius.toPXLength,
      insetStyle: CornerStyle.rounded);
}

Widget DiagonalRectangle(Color color, double width, double height) {
  return Transform.rotate(
    angle: -45,
    child: Container(
      width: width, // Ancho del rectángulo
      height: height, // Alto del rectángulo
      color: color, // Color del rectángulo
    ),
  );
}

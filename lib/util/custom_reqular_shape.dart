import 'package:flutter/material.dart';

class CustomHexagonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double y = size.height;
    double x = size.width;

    var points = [
      Offset(0, y / 2),
      Offset(x / 4, y),
      Offset(x / 4 * 3, y),
      Offset(x, y / 2),
      Offset(x / 4 * 3, 0),
      Offset(x / 4, 0),
    ];

    Path path = Path()
      ..addPolygon(points, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

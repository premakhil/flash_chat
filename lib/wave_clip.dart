import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 4,
        size.height,
        size.width / 2,
        size.height - 30,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height - 60,
        size.width,
        size.height - 20,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

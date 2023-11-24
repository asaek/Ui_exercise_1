import 'package:flutter/material.dart';

class DiagonalEsquinaClipper extends CustomClipper<Path> {
  final double esquina;

  DiagonalEsquinaClipper({super.reclip, required this.esquina});
  @override
  Path getClip(Size size) {
    var path = Path();
    // Aquí defines la forma que deseas
    path.lineTo(0, size.height);
    path.lineTo(size.width - esquina,
        size.height); // Corta 50px de la esquina inferior derecha
    path.lineTo(size.width, size.height - esquina);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

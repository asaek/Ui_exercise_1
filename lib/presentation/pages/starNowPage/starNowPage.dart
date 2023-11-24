import 'dart:math';

import 'package:aplicacion_1/cofig/estaticos/page_view_titulos.dart';
import 'package:aplicacion_1/presentation/providers/providers.dart';
import 'package:aplicacion_1/presentation/widgets/common/tokens/colores.dart';
import 'package:aplicacion_1/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StarNowPage extends StatelessWidget {
  static const routerName = 'StarNowPage';
  const StarNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double alturaCuadroFoto = size.height * 0.27;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomPaint(
            painter: _PainterReguilete(),
            child:
                Container(), // Aquí puedes añadir otros widgets encima del fondo
          ),
          const BlurFilter(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SafeArea(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NEON:POSTY.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails details) {
                    final int paginaACtual =
                        Provider.of<StarNowPageProvider>(context, listen: false)
                            .getPaginaActual;

                    print(details.velocity.pixelsPerSecond.dx);
                    if (details.velocity.pixelsPerSecond.dx > 0) {
                      Provider.of<StarNowPageProvider>(context, listen: false)
                          .setPaginaActual = paginaACtual - 1;
                      // Deslizamiento hacia la derecha
                    } else if (details.velocity.pixelsPerSecond.dx < 0) {
                      // Deslizamiento hacia la izquierda
                      Provider.of<StarNowPageProvider>(context, listen: false)
                          .setPaginaActual = paginaACtual + 1;
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 2),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: SizedBox(
                                  height: alturaCuadroFoto,
                                  child: const PanoramaWidget(
                                    imagen:
                                        'assets/images/lugares/lugarVacaciones.png',
                                    eje: Axis.vertical,
                                    posicion: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: alturaCuadroFoto,
                                child: const PanoramaWidget(
                                  imagen:
                                      'assets/images/lugares/lugarVacaciones2.png',
                                  eje: Axis.horizontal,
                                  posicion: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 2),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: SizedBox(
                                  height: alturaCuadroFoto,
                                  child: const PanoramaWidget(
                                    imagen:
                                        'assets/images/lugares/lugarVacaciones3.png',
                                    eje: Axis.horizontal,
                                    posicion: 3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: alturaCuadroFoto,
                                child: const PanoramaWidget(
                                  imagen:
                                      'assets/images/lugares/lugarVacaciones4.png',
                                  eje: Axis.vertical,
                                  posicion: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _TituloPageView(
                  controller:
                      Provider.of<StarNowPageProvider>(context, listen: false)
                          .getPageControllerText1,
                  listaTextos: fila1,
                ),
                _TituloPageView(
                  controller:
                      Provider.of<StarNowPageProvider>(context, listen: false)
                          .getPageControllerText2,
                  listaTextos: fila2,
                ),
                _TituloPageView(
                  controller:
                      Provider.of<StarNowPageProvider>(context, listen: false)
                          .getPageControllerText3,
                  listaTextos: fila3,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        DotPage(pocicion: 0),
                        DotPage(pocicion: 1),
                        DotPage(pocicion: 2),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SafeArea(
                  top: false,
                  bottom: true,
                  child: ClipPath(
                    clipper: DiagonalEsquinaClipper(esquina: 28),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 60,
                        child: Material(
                          color: colorPrincipal,
                          child: InkWell(
                            onTap: () {
                              context.push('/perfilGroupPage');
                            },
                            child: const Center(
                              child: Text(
                                'STAR NOW',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TituloPageView extends StatelessWidget {
  final PageController controller;
  final List<String> listaTextos;
  const _TituloPageView({
    required this.controller,
    required this.listaTextos,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: PageView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              listaTextos[index],
              // textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PainterReguilete extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    bool alternarColor = true;
    final lapiz = Paint()
      ..color = colorPrincipal
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    // Definir el path para una de las puntas
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.4, // Control point X
      size.height * 0.3, // Control point Y
      size.width * 0.5, // End point X
      size.height * 0.3, // End point Y
    );
    path.lineTo(size.width * 0.6, size.height * 0.5); // Line to bottom right
    path.close();

    // Dibujar el path cuatro veces rotado alrededor del centro
    for (int i = 0; i < 4; i++) {
      // Guardar el estado actual del canvas
      canvas.save();
      // Mover el canvas al centro
      canvas.translate(size.width * 0.5, size.height * 0.5);
      // Rotar el canvas 90 grados por cada punta
      canvas.rotate(pi / 2 * i);
      // Mover de vuelta el origen del canvas
      canvas.translate(-size.width * 0.5, -size.height * 0.5);
      // Dibujar el path
      if (alternarColor) {
        lapiz.color = colorPrincipal;
        alternarColor = !alternarColor;
      } else {
        lapiz.color = colorAlternativo;
        alternarColor = !alternarColor;
      }
      canvas.drawPath(path, lapiz);
      // Restaurar el estado previo del canvas
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

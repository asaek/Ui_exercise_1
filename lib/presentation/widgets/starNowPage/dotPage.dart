import 'package:aplicacion_1/presentation/providers/starNowPage/starNowPageProvider.dart';
import 'package:aplicacion_1/presentation/widgets/common/tokens/colores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotPage extends StatelessWidget {
  final int pocicion;
  final bool? seleccionada;

  const DotPage({
    super.key,
    required this.pocicion,
    this.seleccionada,
  });

  @override
  Widget build(BuildContext context) {
    const double tamanoSeleccionado = 35.0;

    return Selector<StarNowPageProvider, int>(
      selector: (_, provider) => provider.getPaginaActual,
      builder: (_, paginaActual, __) {
        if (pocicion == 1) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeIn,
              width: paginaActual == pocicion ? tamanoSeleccionado : 8,
              height: 8,
              decoration: BoxDecoration(
                color: paginaActual == pocicion ? colorPrincipal : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        } else {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
            width: paginaActual == pocicion ? tamanoSeleccionado : 8,
            height: 8,
            decoration: BoxDecoration(
              color: paginaActual == pocicion ? colorPrincipal : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          );
        }
      },
    );
  }
}

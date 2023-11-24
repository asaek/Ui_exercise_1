import 'package:aplicacion_1/cofig/estaticos/page_view_list_images.dart';
import 'package:aplicacion_1/presentation/providers/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PanoramaWidget extends StatelessWidget {
  final String imagen;
  final int posicion;
  final Axis eje;
  const PanoramaWidget({
    super.key,
    required this.imagen,
    required this.posicion,
    required this.eje,
  });

  @override
  Widget build(BuildContext context) {
    if (posicion == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PageView.builder(
          scrollDirection: eje,
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<StarNowPageProvider>(context, listen: false)
              .getPageControllerView1,
          itemCount: pageViewParis.length,
          itemBuilder: (context, index) {
            return Image.asset(
              pageViewParis[index],
              fit: BoxFit.cover,
            );
          },
        ),
      );
    } else if (posicion == 2) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PageView.builder(
          scrollDirection: eje,
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<StarNowPageProvider>(context, listen: false)
              .getPageControllerView2,
          itemCount: pageViewPiramides.length,
          itemBuilder: (context, index) {
            return Image.asset(
              pageViewPiramides[index],
              fit: BoxFit.cover,
            );
          },
        ),
      );
    }
    if (posicion == 3) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PageView.builder(
          scrollDirection: eje,
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<StarNowPageProvider>(context, listen: false)
              .getPageControllerView3,
          itemCount: pageViewLatino.length,
          itemBuilder: (context, index) {
            return Image.asset(
              pageViewLatino[index],
              fit: BoxFit.cover,
            );
          },
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PageView.builder(
          scrollDirection: eje,
          physics: const NeverScrollableScrollPhysics(),
          controller: Provider.of<StarNowPageProvider>(context, listen: false)
              .getPageControllerView4,
          itemCount: pageViewCasaBlanca.length,
          itemBuilder: (context, index) {
            return Image.asset(
              pageViewCasaBlanca[index],
              fit: BoxFit.cover,
            );
          },
        ),
      );
    }
  }
}

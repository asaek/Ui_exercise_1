import 'dart:ui';

import 'package:aplicacion_1/cofig/estaticos/list_avatares.dart';
import 'package:aplicacion_1/domain/entities/Entities.dart';
import 'package:aplicacion_1/presentation/providers/providers.dart';
import 'package:aplicacion_1/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PerfilGroupPage extends StatelessWidget {
  static const String routerName = 'perfilGroupPage';
  const PerfilGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Color de fondo de la barra de estado
        statusBarIconBrightness:
            Brightness.light, // Brillo de los íconos (claro u oscuro)
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Selector<PerfilGroupProvidder, AvatarObject>(
              selector: (_, PerfilGroupProvidder provider) =>
                  provider.getAvatarSeleccionado,
              builder: (_, AvatarObject avatar, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Container(
                    key: ValueKey(avatar.wallpapers),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            avatar.wallpapers), // Fondo de pantalla del avatar
                      ),
                    ),
                  ),
                );
              },
            ),
            Column(
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const SizedBox(
                      height: 45,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SafeArea(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _FotoPerfil(),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Selector<PerfilGroupProvidder, AvatarObject>(
                            selector: (_, PerfilGroupProvidder provider) =>
                                provider.getAvatarSeleccionado,
                            builder: (_, AvatarObject avatar, __) => Column(
                              children: [
                                Text(
                                  avatar.hora,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.place),
                                    Text(
                                      avatar.lugar,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: size.height * 0.4,
                            width: size.width * 0.163,
                            child: _AvatarSelectionado(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SafeArea(
                  top: false,
                  bottom: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: const SizedBox(
                        child: Material(
                          color: Colors.black,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _iconoMenu(
                                  icono: Icons.home_rounded,
                                  posicion: 0,
                                ),
                                _iconoMenu(
                                  icono: Icons.play_arrow_rounded,
                                  posicion: 1,
                                ),
                                _iconoMenu(
                                  icono: Icons.person_2_rounded,
                                  posicion: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _iconoMenu extends StatelessWidget {
  final IconData icono;
  final int posicion;
  const _iconoMenu({
    required this.icono,
    required this.posicion,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      clipBehavior: Clip.hardEdge,
      child: Selector<PerfilGroupProvidder, int>(
        selector: (_, PerfilGroupProvidder provider) =>
            provider.getMenuSeleccionado,
        builder: (_, int menuSeleccionado, __) => InkWell(
          onTap: () => Provider.of<PerfilGroupProvidder>(context, listen: false)
              .setMenuSeleccionado = posicion,
          child: Icon(
            icono,
            color: (menuSeleccionado == posicion)
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            size: 45,
          ),
        ),
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ClipPath(
        clipper: DiagonalEsquinaClipper(esquina: 80),
        child: Material(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipPath(
              clipper: DiagonalEsquinaClipper(esquina: 80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: size.height * 0.27,
                  width: size.width * 0.47,
                  child: Selector<PerfilGroupProvidder, AvatarObject>(
                    selector: (_, PerfilGroupProvidder provider) =>
                        provider.getAvatarSeleccionado,
                    builder: (_, AvatarObject avatar, __) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            key: ValueKey(avatar.imagen),
                            avatar.imagen,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarSelectionado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < 4; i++) {
      listAvatares[i].y = (size.height * 0.1) + (i * 50);
      // listAvatares[i].moverY = listAvatares[i].y + (i * 15);
    }
    return Selector<PerfilGroupProvidder, int>(
      selector: (_, PerfilGroupProvidder provider) => provider.getMoverAvatar,
      builder: (_, int animar, __) {
        return Stack(
          alignment: Alignment.center,
          children: List.generate(
            4,
            (index) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                top: (animar == index)
                    ? listAvatares[index].moverY
                    : listAvatares[index].y,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<PerfilGroupProvidder>(context, listen: false)
                        .setMoverAvatar = index;
                    Provider.of<PerfilGroupProvidder>(context, listen: false)
                        .setAvatarSeleccionado = listAvatares[index];
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      padding: (animar == index)
                          ? const EdgeInsets.all(3)
                          : const EdgeInsets.all(0),
                      color: Colors.black,
                      child: CircleAvatar(
                        radius: size.width * 0.074,
                        backgroundImage: AssetImage(
                          listAvatares[index].imagen,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

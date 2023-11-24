import 'package:aplicacion_1/cofig/estaticos/list_avatares.dart';
import 'package:aplicacion_1/domain/entities/Entities.dart';
import 'package:flutter/material.dart';

class PerfilGroupProvidder with ChangeNotifier {
  int _moverAvatar = 0;
  int get getMoverAvatar => _moverAvatar;
  set setMoverAvatar(int moverAvatar) {
    _moverAvatar = moverAvatar;
    notifyListeners();
  }

  AvatarObject _avatarSeleccionado = listAvatares[0];
  AvatarObject get getAvatarSeleccionado => _avatarSeleccionado;
  set setAvatarSeleccionado(AvatarObject avatarSeleccionado) {
    _avatarSeleccionado = avatarSeleccionado;
    notifyListeners();
  }

  int _menuSeleccionado = 0;
  int get getMenuSeleccionado => _menuSeleccionado;
  set setMenuSeleccionado(int menuSeleccionado) {
    _menuSeleccionado = menuSeleccionado;
    notifyListeners();
  }
}

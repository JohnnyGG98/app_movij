import 'package:app_movij/pages/home.dart';
import 'package:app_movij/pages/menu/juegos/menu_juego.dart';
import 'package:app_movij/pages/menu/seleccionar_perfil.dart';
import 'package:flutter/material.dart';

class ButtonMenuModel {
  String label;
  String page;
  IconData icon;
  Widget widget;

  ButtonMenuModel({
    @required this.label,
    @required this.page,
    @required this.icon,
    @required this.widget,
  });

  /// Devolvemos si el button tiene ruta
  /// Si no tiene ruta se debe usar una funcion
  get haveRoute {
    return page != '';
  }
}

List<ButtonMenuModel> buttonsMenu = [
  ButtonMenuModel(
    label: 'Inicio',
    page: '/',
    icon: Icons.home,
    widget: HomePage(),
  ),
  ButtonMenuModel(
    label: 'Perfiles',
    page: 'seleccionarPerfil',
    icon: Icons.person,
    widget: SeleccionarPerfilPage(),
  ),
  ButtonMenuModel(
    label: 'Juegos',
    page: 'menuJuego',
    icon: Icons.gamepad_rounded,
    widget: MenuJuegoPage(),
  ),
];

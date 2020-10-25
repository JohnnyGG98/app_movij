import 'package:flutter/material.dart';

class ButtonMenuModel {
  String label;
  String page;
  IconData icon;

  ButtonMenuModel({
    @required this.label,
    @required this.page,
    @required this.icon,
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
  ),
  ButtonMenuModel(
    label: 'Perfiles',
    page: 'seleccionarPerfil',
    icon: Icons.person,
  ),
  ButtonMenuModel(
    label: 'Juegos',
    page: 'menuJuego',
    icon: Icons.gamepad_rounded,
  ),
  // BORRAR ABAJO
  ButtonMenuModel(
    label: 'Inicio',
    page: '/',
    icon: Icons.home,
  ),
  ButtonMenuModel(
    label: 'Perfiles',
    page: 'seleccionarPerfil',
    icon: Icons.person,
  ),
  ButtonMenuModel(
    label: 'Juegos',
    page: 'menuJuego',
    icon: Icons.gamepad_rounded,
  ),
  ButtonMenuModel(
    label: 'Inicio',
    page: '/',
    icon: Icons.home,
  ),
  ButtonMenuModel(
    label: 'Perfiles',
    page: 'seleccionarPerfil',
    icon: Icons.person,
  ),
  ButtonMenuModel(
    label: 'Juegos',
    page: 'menuJuego',
    icon: Icons.gamepad_rounded,
  ),
  ButtonMenuModel(
    label: 'Inicio',
    page: '/',
    icon: Icons.home,
  ),
  ButtonMenuModel(
    label: 'Perfiles',
    page: 'seleccionarPerfil',
    icon: Icons.person,
  ),
  ButtonMenuModel(
    label: 'Juegos',
    page: 'menuJuego',
    icon: Icons.gamepad_rounded,
  ),
];

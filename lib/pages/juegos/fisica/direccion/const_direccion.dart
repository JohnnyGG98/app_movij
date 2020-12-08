import 'package:flutter/material.dart';

const int MOVEMENT = 5;
const double ANIMATE_HORIZONTAL = 0.75;
const double ANIMATE_VERTICAL = 1.75;

class Direccion {
  IconData icon;
  String label;
  Tween<Offset> animation;

  Direccion({
    this.icon,
    this.label,
    this.animation,
  });
}

Map<String, Direccion> direcciones = {
  'arriba': Direccion(
    icon: Icons.arrow_upward,
    label: 'Arriba',
    animation: Tween<Offset>(begin: Offset(0, ANIMATE_VERTICAL), end: Offset(0, -ANIMATE_VERTICAL)),
  ),
  'abajo': Direccion(
    icon: Icons.arrow_downward,
    label: 'Abajo',
    animation: Tween<Offset>(begin: Offset(0, -ANIMATE_VERTICAL), end: Offset(0, ANIMATE_VERTICAL)),
  ),
  'derecha': Direccion(
    icon: Icons.arrow_forward,
    label: 'Derecha',
    animation: Tween<Offset>(begin: Offset(-ANIMATE_HORIZONTAL, 0), end: Offset(ANIMATE_HORIZONTAL, 0)),
  ),
  'izquierda': Direccion(
    icon: Icons.arrow_back,
    label: 'izquierda',
    animation: Tween<Offset>(begin: Offset(ANIMATE_HORIZONTAL, 0), end: Offset(-ANIMATE_HORIZONTAL, 0)),
  )
};


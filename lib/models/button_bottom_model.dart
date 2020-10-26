import 'package:flutter/material.dart';

class ButtonBottomModel {
  int page;
  String label;
  IconData icon;
  Color color;

  ButtonBottomModel({
    @required this.page,
    @required this.label,
    @required this.icon,
    @required this.color,
  });
}

List<ButtonBottomModel> buttonsBottom = [
  ButtonBottomModel(
    page: 0,
    label: 'Fisica',
    icon: Icons.touch_app,
    color: Color(0xFF00BE4C),
  ),
  ButtonBottomModel(
    page: 1,
    label: 'Lenguaje',
    icon: Icons.record_voice_over,
    color: Color(0xFF00BE4C),
  ),
];

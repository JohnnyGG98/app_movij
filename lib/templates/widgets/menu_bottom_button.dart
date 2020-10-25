import 'package:flutter/material.dart';

class MenuBottomButton extends StatelessWidget {
  final Color primary;
  final Color shadow;
  final String label;
  final Function onTap;

  const MenuBottomButton({
    Key key,
    @required this.primary,
    @required this.shadow,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: this.primary,
        border: Border(
          top: BorderSide(
            color: this.shadow,
            width: 3,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: this.shadow.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, -1),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Text(
        this.label.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

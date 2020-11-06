import 'package:flutter/material.dart';

class ButtonOptionGame extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String label;

  const ButtonOptionGame({
    Key key,
    @required this.onTap,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 22.5),
        padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 30),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 3.5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              offset: Offset(6, 7),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
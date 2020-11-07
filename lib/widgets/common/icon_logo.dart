import 'package:flutter/material.dart';

class IconLogon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      height: 60,
      child: Image(
        image: AssetImage('assets/icon/icon.png'),
        fit: BoxFit.contain,
      ),
    );
  }
}

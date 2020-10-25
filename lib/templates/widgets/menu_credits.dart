import 'package:flutter/material.dart';

class MenuCredits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF34495E),
            spreadRadius: 1.5,
            offset: Offset(-5, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            'MOVIJ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF34495E),
            ),
          ),
          SizedBox(height: 7.5),
          Text(
            'by: Zero Team',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF34495E),
            ),
          ),
        ],
      ),
    );
  }
}

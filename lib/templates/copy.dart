import 'package:flutter/material.dart';

Widget getCopy(Color color) {
  return Container(
    child: Column(
      children: <Widget>[
        Text('MOVIJ', 
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 5,
            color: color
          ),
        ),

        SizedBox(height: 5,),

        Text('by: Zero Team', 
          style: TextStyle(
            color: color,
            fontSize: 12.0
          ),
        )
      ],
    ),
  );
}
import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class HomeCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: AppThemeColors.BLUE,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            offset: Offset(-3, 2),
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
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'by: Zero Team',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

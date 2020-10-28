import 'package:app_movij/config/config_export.dart';
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
            color: AppThemeColors.BLUE,
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
              color: AppThemeColors.BLUE,
            ),
          ),
          SizedBox(height: 7.5),
          Text(
            'by: Zero Team',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppThemeColors.BLUE,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class CloseButtonGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppThemeColors.RED,
          border: Border.all(
            color: AppThemeColors.BLACK,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppThemeColors.BLACK,
              spreadRadius: 1,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}

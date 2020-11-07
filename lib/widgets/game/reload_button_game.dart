import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class ReloadButtonGame extends StatelessWidget {
  final Function onTap;

  const ReloadButtonGame({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
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
          Icons.refresh,
        ),
      ),
    );
  }
}

import 'package:app_movij/config/config_export.dart';
import 'package:app_movij/models/button_menu_model.dart';
import 'package:app_movij/utils/global.dart';
import 'package:app_movij/utils/transitions.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final ButtonMenuModel model;

  const MenuOption({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String route = Global().actualRoute;
    final bool isActualPage = route == model.page;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppThemeColors.WHITE,
              width: 7.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              model.icon,
              color: AppThemeColors.BLUE,
            ),
            SizedBox(width: 10),
            Text(
              model.label,
              style: TextStyle(
                color: AppThemeColors.BLUE,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isActualPage) ...[
              Spacer(),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: AppThemeColors.BLUE,
                  shape: BoxShape.circle,
                ),
              ),
            ]
          ],
        ),
      ),
      onTap: () {
        Global().actualRoute = model.page;
        // Si es la pagina actual solo hacemos un pop
        Navigator.of(context).pop();
        if (!isActualPage) {
          Navigator.push(context, DefaultFadeTransition(child: model.widget));
        }
      },
    );
  }
}

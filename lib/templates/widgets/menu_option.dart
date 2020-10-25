import 'package:app_movij/models/button_menu_model.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final ButtonMenuModel model;

  const MenuOption({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String route = ModalRoute.of(context).settings.name;
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
              color: Color(0xFFECEBEB),
              width: 7.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              model.icon,
              color: Color(0xFF34495E),
            ),
            SizedBox(width: 10),
            Text(
              model.label,
              style: TextStyle(
                color: Color(0xFF34495E),
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
                  color: Color(0xFF34495E),
                  shape: BoxShape.circle,
                ),
              ),
            ]
          ],
        ),
      ),
      onTap: () {
        // Si es la pagina actual solo hacemos un pop
        if (isActualPage) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushReplacementNamed(model.page);
        }
      },
    );
  }
}

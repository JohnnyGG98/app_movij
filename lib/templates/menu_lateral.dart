import 'package:app_movij/C/colors.dart';
import 'package:app_movij/templates/copy.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Opciones',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 25),
                      width: double.infinity,
                      child: getCopy(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: PRIMARY_COLOR),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Seleccionar perfil'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('seleccionarPerfil');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.gamepad),
            title: Text('Juegos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('menuJuego');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text('Iniciar sesión'),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}

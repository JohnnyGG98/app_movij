import 'package:app_movij/templates/fondo.dart';
import 'package:app_movij/templates/menu_lateral.dart';
import 'package:app_movij/templates/widgets/responsive.dart';
import 'package:flutter/material.dart';

class SeleccionarPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Perfil'),
      ),
      body: CustomPaint(
        painter: PerfilPainter(),
        child: Container(
          child: _getPerfiles(context),
        ),
      ),
      drawer: MenuLateral(),
    );
  }

  _getPerfiles(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: 60,
        mainAxisSpacing: 10,
      ),
      itemCount: perfiles.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('menuJuego');
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.black38),
                    image: DecorationImage(
                      image: AssetImage('assets/app/pocoyo_bg.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(perfiles[i]),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Data
List perfiles = [
  'JOHNNY',
  'GUSTAVO',
  'EDISSON',
  'ALEXANDER',
  'DENNIS',
  'EVELIN',
  'CARLOS',
  'JOHNNY',
  'GUSTAVO',
  'EDISSON',
  'ALEXANDER',
  'DENNIS',
  'EVELIN',
  'CARLOS'
];

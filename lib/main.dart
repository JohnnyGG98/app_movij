import 'package:app_movij/pages/home.dart';
import 'package:app_movij/pages/juegos/fisica/EncuentraMenu.dart';
import 'package:app_movij/pages/menu/juegos/menu_juego.dart';
import 'package:app_movij/pages/menu/seleccionar_perfil.dart';
import 'package:app_movij/components/add_game.dart';
import 'package:app_movij/utils/flame_const.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  
  runApp(MyApp());
  flameUtil.addGestureRecognizer(FlameConst.TAPPER);

  FlameConst.miFlameUtil = flameUtil;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movij',
      initialRoute: '/',
      routes: {
        '/': (BuildContext ct) => HomePage(),
        'seleccionarPerfil': (BuildContext ct) => SeleccionarPerfilPage(),
        'menuJuego': (BuildContext ct) => MenuJuegoPage(),

        // Juegos  
        'juego/tf/encuentra': (BuildContext ct) => MenuEncuentraPage(),

        // Juego Page 
        'jugar': (BuildContext ct) => AddGame()
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 73, 94, 1.0),
        accentColor: Color.fromRGBO(39, 174, 96, 1.0)
      ),
    );
  }
}
import 'package:app_movij/pages/home.dart';
import 'package:app_movij/pages/juegos/fisica/EncuentraMenu.dart';
import 'package:app_movij/pages/menu/juegos/menu_juego.dart';
import 'package:app_movij/pages/menu/seleccionar_perfil.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
        'juego/tf/encuentra': (BuildContext ct) => MenuEncuentraPage()
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 73, 94, 1.0),
        accentColor: Color.fromRGBO(39, 174, 96, 1.0)
      ),
    );
  }
}
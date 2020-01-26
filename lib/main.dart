import 'package:app_movij/pages/home.dart';
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
        '/': (BuildContext ct) => HomePage()
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 73, 94, 1.0),
        accentColor: Color.fromRGBO(39, 174, 96, 1.0)
      ),
    );
  }
}
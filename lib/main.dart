import 'package:flutter/material.dart';
import 'package:queuey/Nasr/11-book%20Q%20now.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queuey',
      theme: ThemeData(
        primaryColor: Color(0xff329D9C),
        accentColor: Color(0xff40A3A3),
        fontFamily: 'OpenSans',
      ),
      home: BookQNow(), //SplashScreen(),
    );
  }
}

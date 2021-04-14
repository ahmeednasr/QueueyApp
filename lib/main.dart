import 'package:flutter/material.dart';

import 'Algaraiehy/5-congrats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q',
      theme: ThemeData(
        primaryColor: Color(0xff329D9C),
        accentColor: Color(0xff40A3A3),
        fontFamily: 'OpenSans',
      ),
      home: Congrats(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:queuey/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queue.Y',
      theme: ThemeData(
        primaryColor: Color(0xff329D9C),
        accentColor: Color(0xff40A3A3),
        fontFamily: 'OpenSans',
      ),
      home: SplashScreen(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/NavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '1 -AbdAlmonem/2-sign in-up.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _token;
  @override
  void initState() {
    _checkCurrentUser();
    Timer(Duration(seconds: 2), () {
      _token == null
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SiginInUp()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NavBar()));
    });
    super.initState();
  }

  _checkCurrentUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = _prefs.getString('token');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .5,
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
            Text(
              'QueueY',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 48,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Queue of one',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

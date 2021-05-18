import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20View.dart';

class Congrats extends StatefulWidget {
  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          Container(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Screens/5-congrats/accept_img.png',
                ),
              ),
            ),
          ), //accept_img container
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Center(
            child: Container(
              height: 75,
              width: 75,
              child: Image.asset(
                'assets/images/Screens/5-congrats/ok logo.png',
              ),
            ),
          ), //ok_img container

          Text(
            "Congrats! \nYou'll have an account now!",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: 25.0,
              color: Color(0xff40A3A3),
            ), //TextStyle
          ), //row
          SizedBox(
            height: 10,
          )
        ],
      ),
    ); //Scaffold
  }
} // Congrats class

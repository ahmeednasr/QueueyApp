import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20View.dart';

class SuccessWelcome extends StatefulWidget {
  
  @override
  _SuccessWelcomeState createState() => _SuccessWelcomeState();
}

class _SuccessWelcomeState extends State<SuccessWelcome> {
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(33.0),
                bottomLeft: Radius.circular(33.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Screens/7-Success welcome/7-Success welcome.png',
                  width: 140,
                  height: 140,
                ), //Image
                SizedBox(
                  height: 20,
                ),
                Text(
                  'success',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ), //Text
              ], //children Column
            ), //Column
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to QueueY!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'We will contact you soon..',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ), //Container
    ); //Scaffold
  } } //SuccessWelcome

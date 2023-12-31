import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/11-book%20Q%20now.dart';

class LoginSuccessfull extends StatelessWidget {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BookQNow(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                'Login successfully!',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  //   fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(_createRoute());
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  elevation: 0, // to hide bottom shado
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ), //Container
    ); //Scaffold
  } //build
} //SuccessWelcome

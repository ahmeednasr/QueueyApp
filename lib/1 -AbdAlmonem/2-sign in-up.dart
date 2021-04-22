import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20View.dart';

import '3-user business.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SiginInUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "QueueY",
              style: TextStyle(
                  fontSize: 48, color: Theme.of(context).primaryColor),
            ),
            Container(
              padding: EdgeInsets.all(9),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color.fromRGBO(50, 157, 156, .25)),
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    width: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                  primary: Colors.white, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  primary: Theme.of(context).primaryColor, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserBusiness()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

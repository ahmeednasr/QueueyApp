import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/31-settings.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Setting(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1, 0); //Offset(1.0, 0.0);
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

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, BuildContext context})
      : super(
          toolbarHeight: 120,
          key: key,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    //color: Colors.yellow,
                    padding: EdgeInsets.all(11),
                    child: Image(
                      image: AssetImage('assets/images/MyAppBar/list.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color.fromRGBO(50, 157, 156, .25)),
                  child:
                      Image(image: AssetImage('assets/images/Queue-amico.png')),
                ),
                InkWell(
                  /*onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => screen()));
              },*/
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image(
                        image:
                            AssetImage('assets/images/MyAppBar/profile.png')),
                  ),
                ),
              ]),
          actions: <Widget>[],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
        );
}

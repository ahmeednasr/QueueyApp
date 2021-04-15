import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, BuildContext context})
      : super(
          key: key,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              /*onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => screen()));
              },*/
              child: Container(
                height: 35,
                width: 35,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                child: Image(
                  image: AssetImage('assets/images/MyAppBar/list.png'),
                  fit: BoxFit.contain,
                ),
              ),
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
                    image: AssetImage('assets/images/MyAppBar/profile.png')),
              ),
            ),
          ]),
          actions: <Widget>[],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
        );
}

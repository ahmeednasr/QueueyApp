import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/31-settings.dart';

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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Setting()));
                      },
                      child: Image(
                        image: AssetImage('assets/images/MyAppBar/list.png'),
                        fit: BoxFit.contain,
                      ),
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/31-settings.dart';
import 'package:queuey/3%20-Nasr/Profile/Profile%20View.dart' as profileView;

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

Route _profileRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        profileView.ProfileView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0); //Offset(1.0, 0.0);
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
                  onTap: () {
                    Navigator.of(context).push(_profileRoute());
                  },
                  child: CircleAvatar(
                      radius: 21.0,
                      backgroundImage: profileView.imageFunction() == null
                          ? AssetImage('assets/images/MyAppBar/profile.png')
                          : FileImage(File(profileView.imageFunction().path))),
                ),
              ]),
          actions: <Widget>[],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
        );
}
/*class MyAppBarr extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppBarr({
    Key key,
  })  : preferredSize = Size.fromHeight(120.0),
        super(key: key);
  _MyAppBarrState createState() => _MyAppBarrState();
}

class _MyAppBarrState extends State<MyAppBarr> {
  @override
  void initState() {
    profileView.imageFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
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
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(_profileRoute());
              },
              child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: profileView.imageFunction() == null
                      ? AssetImage('assets/images/MyAppBar/profile.png')
                      : FileImage(File(profileView.imageFunction().path))),
            ),
          ]),
      actions: <Widget>[],
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}*/

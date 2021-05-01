import 'package:flutter/material.dart';

import '../31-settings.dart';

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

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(50, 157, 156, .25)),
                child:
                    Image(image: AssetImage('assets/images/Queue-amico.png')),
              ),
            ]),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Container(
                width: 125,
                height: 125,
                //  color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Image(
                          image:
                              AssetImage('assets/images/MyAppBar/profile.png')),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {})),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

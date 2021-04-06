import 'package:flutter/material.dart';

class BookQNow extends StatelessWidget {
  List<String> _images = [
    'assets/images/Screens/11-book Q now/index1.png',
    'assets/images/Screens/11-book Q now/index2.png',
    'assets/images/Screens/11-book Q now/index3.png',
    'assets/images/Screens/11-book Q now/index4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
            ),
            child: Image(
                image: AssetImage(
                    'assets/images/Screens/11-book Q now/profile.png')),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(50, 157, 156, .25)),
                child:
                    Image(image: AssetImage('assets/images/Queue-amico.png')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

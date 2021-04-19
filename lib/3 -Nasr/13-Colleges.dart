import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

import '19-select department.dart';

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  double _nimo = 1;
  _nimoContainer({String image, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: _nimo,
          width: _nimo,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image(image: AssetImage(image))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
            height: MediaQuery.of(context).size.height * .9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(50, 157, 156, .28),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/2.png',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectDepartment()));
                        }),
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/3.png'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/4.png'),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _nimo = 90;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image(
                            image: AssetImage(
                                'assets/images/Screens/13-Colleges/1.png')),
                      ),
                    ),
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/5.png'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/6.png'),
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/7.png'),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:queuey/2%20-Algaraiehy/14-select%20service.dart';

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  double _nimo = 1;
  bool _nimocondition = false;
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectService()));
                        }),
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/5.png'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/3.png'),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _nimocondition = !_nimocondition;
                          if (_nimocondition == true) {
                            _nimo = 90;
                          }
                          if (_nimocondition == false) {
                            _nimo = 0;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        height: 90,
                        width: 90,
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
                        image: 'assets/images/Screens/13-Colleges/7.png'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/4.png'),
                    _nimoContainer(
                        image: 'assets/images/Screens/13-Colleges/6.png'),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

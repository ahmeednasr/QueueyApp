import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/13-Colleges.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class HomeScreen extends StatelessWidget {
  _card({String image, String name}) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 109,
          height: 109,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            name,
            style: TextStyle(
              color: Color(0xff3A4D4D),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.tealAccent,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Text(
                'Select your destination',
                style: TextStyle(
                  color: Color(0xff3A4D4D),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              TextField(
                controller: null,
                autofocus: false,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff000000),
                ),
                decoration: new InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 27,
                      ),
                    ),
                  ),

                  filled: true,
                  fillColor: Color.fromRGBO(121, 190, 190, 0.52),
                  hintText: 'Search for destination',
                  hintStyle:
                      TextStyle(fontSize: 20.0, color: Color(0xff919191)),
                  contentPadding:
                      const EdgeInsets.only(left: 10.0, bottom: 6.0, top: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(20),
                  ), // to keep circular border when input
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                ),
              ), //TextField

              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  // color: Color(0xffcccccc),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    padding: EdgeInsets.all(0),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Colleges()));
                          },
                          child: _card(
                              image:
                                  'assets/images/Screens/12-select destination/1-university.png',
                              name: 'University')), //University
                      _card(
                          image:
                              'assets/images/Screens/12-select destination/2-barber.png',
                          name: 'Barber Shop'),
                      _card(
                          image:
                              'assets/images/Screens/12-select destination/3-hospital.png',
                          name: 'Hospital'),
                      _card(
                          image:
                              'assets/images/Screens/12-select destination/4-bank.png',
                          name: 'Bank'),
                      _card(
                          image:
                              'assets/images/Screens/12-select destination/5-parking.png',
                          name: 'Car Parking'),
                      _card(
                          image:
                              'assets/images/Screens/12-select destination/6-cafe.png',
                          name: 'Cafe'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

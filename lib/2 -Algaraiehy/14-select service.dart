import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/19-select%20department.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class SelectService extends StatelessWidget {
  _card({String image, String name}) {
    return Container(
      //color: Colors.red,
      width: 130,
      height: 130,
      child: Column(
        children: [
          Image.asset(
            image,
            width: 109,
            height: 109,
          ),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Text(
              'Select your service',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
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
                hintText: 'Search for service',
                hintStyle: TextStyle(fontSize: 20.0, color: Color(0xff919191)),
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

            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/1-Labs.png',
                          name: 'Labs',
                        ), //Card1
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectDepartment()));
                        },
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/2-Office hours.png',
                          name: 'Office hours',
                        ), //Card1
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/3-Student Affairs.png',
                          name: 'Student Affairs',
                        ), //Card1
                      ),
                      InkWell(
                        onTap: () {},
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/4-Library.png',
                          name: 'Library',
                        ), //Card1
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/5-Health Care.png',
                          name: 'Health Care',
                        ), //Card1
                      ),
                      InkWell(
                        onTap: () {},
                        child: _card(
                          image:
                              'assets/images/Screens/14-select service/6-Payments.png',
                          name: 'Payments',
                        ), //Card1
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/7-Events.png',
                        name: 'Events',
                      ), //Card1
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

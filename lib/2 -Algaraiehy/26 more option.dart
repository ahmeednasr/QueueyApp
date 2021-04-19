import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class MoreOption extends StatelessWidget {
  _card({String image, String name}) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 109,
          height: 109,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              name,
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        context: context,
      ),
      body: Container(
        // color: Color(0xffcccccc),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Text(
              'More options',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Color.fromRGBO(255, 194, 0, 0.28),
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
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/26-more option/1-About QueueY.png',
                        name: 'About QueueY',
                      ), //card-1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/26-more option/2-Report a Problem.png',
                        name: 'Report a Problem',
                      ), //card-2
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/26-more option/3-Rate QueueY.png',
                        name: 'Rate QueueY',
                      ), //card-3
                    ),
                    _card(
                      image:
                          'assets/images/Screens/26-more option/4-Invite your friends.png',
                      name: 'Invite your friends',
                    ), //card-4
                    InkWell(
                      onTap: () {},
                      child: _card(
                      image:
                          'assets/images/Screens/26-more option/5-Contact us.png',
                      name: 'Contact us',
                    ), //card-5
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

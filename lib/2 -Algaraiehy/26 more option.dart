import 'package:flutter/material.dart';
import 'package:queuey/1%20-AbdAlmonem/27-about%20Queuey.dart';
import 'package:queuey/1%20-AbdAlmonem/28-report%20a%20Problem.dart';
import 'package:queuey/2%20-Algaraiehy/30-contact%20us.dart';
import 'package:queuey/3%20-Nasr/29-rate%20queuey.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class MoreOption extends StatelessWidget {
  _card({String image, String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Container(
        // color: Colors.yellow,
        width: 130,
        height: 155,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 109,
              height: 109,
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
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
            height: 10,
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutQueuey()));
                        },
                        child: _card(
                          image:
                              'assets/images/Screens/26-more option/1-About QueueY.png',
                          name: 'About QueueY',
                        ), //card-1
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportaProblem()));
                        },
                        child: _card(
                          image:
                              'assets/images/Screens/26-more option/2-Report a Problem.png',
                          name: 'Report a Problem',
                        ), //card-2
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RateQueuey()));
                        },
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
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUs()));
                      },
                      child: _card(
                        image:
                            'assets/images/Screens/26-more option/5-Contact us.png',
                        name: 'Contact us',
                      ), //card-5
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

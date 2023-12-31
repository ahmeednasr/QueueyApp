import 'package:flutter/material.dart';

class AboutQueuey extends StatelessWidget {
  _card({context, String title, String content}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "About QueueY",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  _card(
                      context: context,
                      title: 'QueueY',
                      content:
                          "QueueY is a smart solution represented on E-queuing system makes Queue of one!"),
                  _card(
                      context: context,
                      title: "Vision",
                      content:
                          "Make Day to day tasks more easier, smarter and accessible."),
                  _card(
                      context: context,
                      title: 'Mission',
                      content:
                          "Enable easy Queueing experience Booking,Pay Notify, and Tracking through QueueY Business-to-Business service"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

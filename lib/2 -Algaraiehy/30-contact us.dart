import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class ContactUs extends StatelessWidget {
  _myCard({IconData iconData, String text}) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            iconData,
            color: Color(0xff329D9C),
            size: 44,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff3A4D4D),
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
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
              'Contact us',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                _myCard(
                  iconData: Icons.mail_outline,
                  text: 'QueueY.com',
                ), // 1
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                _myCard(
                  iconData: Icons.phone_android_rounded,
                  text: '+20100000000',
                ), // 2
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                _myCard(
                  iconData: Icons.location_on,
                  text: 'Faculty of computer science, Mansoura, Egypt.',
                ), // 3
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/Screens/11-book Q now/facebook.png',
                        fit: BoxFit.fitWidth,
                        width: 50),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/images/Screens/11-book Q now/instagram.png',
                      fit: BoxFit.fitWidth,
                      width: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                        'assets/images/Screens/11-book Q now/Twitter.png',
                        fit: BoxFit.fitWidth,
                        width: 50),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Center(
                  child: Text(
                    '@QueueY',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3A4D4D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), //column
      ),
      
    );
  }
}

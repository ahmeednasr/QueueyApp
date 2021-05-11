import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  _myCard({IconData iconData, String text, context}) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: Color(0xff3A4D4D),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Contact us',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Scrollbar(
                showTrackOnHover: true,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _myCard(
                        iconData: Icons.mail_outline,
                        text: 'QueueY.com',
                        context: context), // 1
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    _myCard(
                        iconData: Icons.phone_android_rounded,
                        text: '+20100000000',
                        context: context), // 2
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    _myCard(
                        iconData: Icons.location_on,
                        text: 'Faculty of computer science, Mansoura, Egypt.',
                        context: context), // 3
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Screens/11-book Q now/facebook.png',
                          width: 44,
                          height: 44,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/images/Screens/11-book Q now/instagram.png',
                          width: 44,
                          height: 44,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/images/Screens/11-book Q now/Twitter.png',
                          width: 44,
                          height: 44,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        '@QueueY',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

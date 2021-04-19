import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  _card({String image, String title, Function ontap}) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image(image: AssetImage(image)),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  Image(image: AssetImage('assets/images/MyAppBar/list.png')),
            ),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(50, 157, 156, .25)),
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _card(
              image: 'assets/images/MyAppBar/profile.png',
              title: 'Profile',
              ontap: () {}),
          _card(
              image: 'assets/images/Screens/31-Settings/code.png',
              title: 'Scan QR code',
              ontap: () {}),
          InkWell(
            onTap: () {
              setState(() {
                isSwitched = !isSwitched;
              });
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image(
                      image: AssetImage(
                          'assets/images/Screens/31-Settings/notification.png')),
                ),
                Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded(child: SizedBox()),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeColor: Colors.green, //Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          _card(
              image: 'assets/images/Screens/31-Settings/help.png',
              title: 'Help',
              ontap: () {}),
          _card(
              image: 'assets/images/Screens/31-Settings/privacy.png',
              title: 'Privacy and Policy',
              ontap: () {}),
          _card(
              image: 'assets/images/Screens/31-Settings/logout.png',
              title: 'Log Out',
              ontap: () {}),
          SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Powered by',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Text(
                'QueueY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

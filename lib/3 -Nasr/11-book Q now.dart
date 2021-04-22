import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';
import 'package:queuey/Custom_Widget/NavigationBar.dart';

class BookQNow extends StatefulWidget {
  @override
  _BookQNowState createState() => _BookQNowState();
}

class _BookQNowState extends State<BookQNow> {
  List<String> _images = [
    'assets/images/Screens/11-book Q now/index1.png',
    'assets/images/Screens/11-book Q now/index2.png',
    'assets/images/Screens/11-book Q now/index3.png',
    'assets/images/Screens/11-book Q now/index4.png',
    'assets/images/Screens/11-book Q now/index5.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        context: context,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              'QueueY',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontStyle: FontStyle.italic,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
              autoplay: true,
              duration: 240,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  image: AssetImage(_images[index]),
                );
              },
              itemCount: _images.length,
              layout: SwiperLayout.DEFAULT,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Wasting time, taking effort, cause the virus ? ',
                  style: TextStyle(
                      //  fontSize: 17,
                      ),
                  overflow: TextOverflow.visible,
                ),
              ),
              Icon(
                Icons.tag_faces,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
          Center(
            child: Text(
              'sure!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'So we did a ',
                  style: TextStyle(
                      //  fontSize: 17,
                      ),
                  overflow: TextOverflow.visible,
                ),
              ),
              Text(
                'QueueY',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  ' to avoid all of that ..',
                  style: TextStyle(
                      //  fontSize: 17,
                      ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // background
                onPrimary: Colors.black, // foreground
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => NavBar()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Book your Queue Now!',
                style: TextStyle(
                    fontSize: 24,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )),
          SizedBox(
            height: 30,
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: Color.fromRGBO(50, 157, 156, .84),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  'assets/images/Screens/11-book Q now/facebook.png'),
              width: 44,
              height: 44,
            ),
            SizedBox(
              width: 15,
            ),
            Image(
              image: AssetImage(
                  'assets/images/Screens/11-book Q now/instagram.png'),
              width: 44,
              height: 44,
            ),
            SizedBox(
              width: 15,
            ),
            Image(
              image:
                  AssetImage('assets/images/Screens/11-book Q now/Twitter.png'),
              width: 44,
              height: 44,
            )
          ],
        ),
      ),
    );
  }
}

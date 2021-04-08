import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:queuey/Algaraiehy/12-select%20destination.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class BookQNow extends StatefulWidget {
  @override
  _BookQNowState createState() => _BookQNowState();
}

class _BookQNowState extends State<BookQNow> {
  List<String> _images = [
    'assets/images/Screens/11-book Q now/index1.png',
    'assets/images/Screens/11-book Q now/index2.png',
    'assets/images/Screens/11-book Q now/index3.png',
    'assets/images/Screens/11-book Q now/index4.png'
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
            child: Container(
              padding: EdgeInsets.all(10),
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color.fromRGBO(50, 157, 156, .25)),
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
          ),
          Center(
            child: Text(
              'QueueY',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontStyle: FontStyle.italic,
                fontSize: 48,
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
              duration: 250,
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
                    fontSize: 17,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  ' to avoid all of that .. ',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectDestination()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Book your Queue Now!',
                    style: TextStyle(
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

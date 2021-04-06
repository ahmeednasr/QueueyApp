import 'package:flutter/material.dart';
import 'package:queuey/Algaraiehy/12-select destination.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
            ),
            child: Image(
                image: AssetImage(
                    'assets/images/Screens/11-book Q now/profile.png')),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(50, 157, 156, .25)),
                child:
                    Image(image: AssetImage('assets/images/Queue-amico.png')),
              ),
            ],
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
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: _images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image(image: AssetImage(_images[index]));
                }),
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

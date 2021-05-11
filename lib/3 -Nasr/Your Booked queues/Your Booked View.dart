import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class YourBookedView extends StatefulWidget {
  @override
  _YourBookedViewState createState() => _YourBookedViewState();
}

class _YourBookedViewState extends State<YourBookedView> {
  List<Map<String, dynamic>> _list = [
    {
      'title': 'Labs',
      'day': 'Saturday, ',
      'date': '17 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Library',
      'day': 'Sunday, ',
      'date': '17 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Student Affairs',
      'day': 'Monday, ',
      'date': '19 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Payments',
      'day': 'Tuesday, ',
      'date': '20 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Events',
      'day': 'Tuesday, ',
      'date': '23 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Doctor',
      'day': 'Saturday, ',
      'date': '17 Mar',
      'time': '8:30 AM - 9 AM'
    },
    {
      'title': 'Florida',
      'day': 'Friday, ',
      'date': '21 Mar',
      'time': '8:30 AM - 9 AM'
    },
  ];
  _card({String title, String day, String date, String time, int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff7070701A).withOpacity(.12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.access_time,
              color: Colors.grey,
              size: 29,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(color: Color(0xffC69F22), fontSize: 18),
                maxLines: 2,
                //softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: TextStyle(color: Color(0xff8B8B8B), fontSize: 11),
                      maxLines: 1,
                      //softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Color(0xff8B8B8B), fontSize: 11),
                      maxLines: 1,
                      //softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  time,
                  style: TextStyle(color: Color(0xff8B8B8B), fontSize: 11),
                  maxLines: 1,
                  //softWrap: true,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {
                  _removeItemDialog(index);
                })
          ],
        ),
      ),
    );
  }

  _removeItemDialog(index) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Are you sure to remove ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff346161),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '"${_list[index]['title']}"',
                  style: TextStyle(
                    color: Color(0xffC69F22),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.black, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        setState(() {
                          _list.removeAt(index);
                          // List.removeAt(int index)
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.black, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
              child: Text(
            'Your booked queues',
            style: TextStyle(
              color: Color(0xff346161),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return _card(
                      title: _list[index]['title'],
                      day: _list[index]['day'],
                      date: _list[index]['date'],
                      time: _list[index]['time'],
                      index: index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

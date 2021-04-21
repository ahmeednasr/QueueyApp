import 'package:flutter/material.dart';
import 'package:queuey/1%20-AbdAlmonem/20.4%20doctor%20Defult.dart';
import 'package:queuey/3%20-Nasr/13-Colleges.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> _list = [
    {
      'image': 'assets/images/Screens/12-select destination/1-university.png',
      'title': 'University',
      'Screen': Colleges()
    },
    {
      'image': 'assets/images/Screens/12-select destination/2-barber.png',
      'title': 'Barber Shop',
      'Screen': DefultDoctors()
    },
    {
      'image': 'assets/images/Screens/12-select destination/3-hospital.png',
      'title': 'Hospital',
      'Screen': DefultDoctors()
    },
    {
      'image': 'assets/images/Screens/12-select destination/4-bank.png',
      'title': 'Bank',
      'Screen': DefultDoctors()
    },
    {
      'image': 'assets/images/Screens/12-select destination/5-parking.png',
      'title': 'Car Parking',
      'Screen': DefultDoctors()
    },
    {
      'image': 'assets/images/Screens/12-select destination/6-cafe.png',
      'title': 'Cafe',
      'Screen': DefultDoctors()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Select your destination',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: null,
              autofocus: false,
              style: new TextStyle(
                fontSize: 20.0,
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 27,
                    ),
                  ),
                ),

                filled: true,
                fillColor: Color.fromRGBO(121, 190, 190, 0.52),
                hintText: 'Search for destination',
                hintStyle: TextStyle(fontSize: 20.0, color: Color(0xff919191)),
                contentPadding:
                    const EdgeInsets.only(left: 10.0, bottom: 6.0, top: 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(20),
                ), // to keep circular border when input
                enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(20),
                ),
              ),
            ), //TextField

            SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: _list.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.2, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _list[index]['Screen'],
                          ));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            _list[index]['image'],
                            width: 109,
                            height: 109,
                          ),
                          Container(
                            height: 23,
                            width: 106,
                            child: Text(
                              _list[index]['title'],
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff3A4D4D),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class SelectService extends StatelessWidget {
  _card({String image, String name}) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 109,
          height: 109,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              name,
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
              'Select your service',
              style: TextStyle(
                color: Color(0xff3A4D4D),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            TextField(
              controller: null,
              autofocus: false,
              style: new TextStyle(
                fontSize: 20.0,
                color: Color(0xff000000),
              ),
              decoration: new InputDecoration(
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
                hintText: 'Search for service',
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
              height: MediaQuery.of(context).size.height * .03,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Color(0xffcccccc),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  padding: EdgeInsets.all(0),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/1-Labs.png',
                        name: 'Labs',
                      ), //Card1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/2-Office hours.png',
                        name: 'Office hours',
                      ), //Card1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/3-Student Affairs.png',
                        name: 'Student Affairs',
                      ), //Card1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/4-Library.png',
                        name: 'Library',
                      ), //Card1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/5-Health Care.png',
                        name: 'Health Care',
                      ), //Card1
                    ),
                    InkWell(
                      onTap: () {},
                      child: _card(
                        image:
                            'assets/images/Screens/14-select service/6-Payments.png',
                        name: 'Payments',
                      ), //Card1
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

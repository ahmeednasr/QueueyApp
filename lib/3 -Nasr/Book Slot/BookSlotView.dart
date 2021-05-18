import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BookSlotController.dart';

class BookSlotView extends StatefulWidget {
  @override
  _BookSlotViewState createState() => _BookSlotViewState();
}

class _BookSlotViewState extends State<BookSlotView> {
  List _meeting = [];
  BookSlotController _controller = BookSlotController();

  bool _loading = true;
  gettime() async {
    setState(() {
      _loading = true;
    });
    setState(() {
      _meeting.clear();
    });
    _meeting = await _controller.getSlot();
    setState(() {
      _loading = false;
    });
  }

  successfullyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xfffff3cc),
          title: Image(
            image: AssetImage('assets/images/Popup/1.png'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    Text(' You booked a slot ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Successfully',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff28C60B), // background
                          onPrimary: Colors.black, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        gettime();
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        child: Text(
                          'Done',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
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

  bookDialog({int id, index}) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Are you sure to book ...slot?',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, // background
                              onPrimary: Colors.black, // foreground
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.5,
                                  color: Color(0xff3BC552),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            _controller.bookSlot(id: id);
                            Navigator.of(context).pop();
                            successfullyDialog();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, // background
                              onPrimary: Colors.black, // foreground
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.5,
                                  color: Color(0xffF5133A),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xffF5133A),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
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
  void initState() {
    gettime();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Available Appointments:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          gettime();
                        },
                        child: Scrollbar(
                          child: ListView.builder(
                            // physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemCount: _meeting.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.grey[200]),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 115,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.grey[200]),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.calendar,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${_meeting[index]["lab"]["date"]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  CupertinoIcons.clock,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "${_meeting[index]["time"]}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                          child: SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Theme.of(context)
                                                  .primaryColor, // background
                                              onPrimary:
                                                  Colors.black, // foreground
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              )),
                                          onPressed: () {
                                            bookDialog(
                                              id: _meeting[index]["id"],
                                              index: index,
                                            );
                                            print(
                                                "thr id = ${_meeting[index]["id"]}");
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 0),
                                            child: Text(
                                              'Book',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}

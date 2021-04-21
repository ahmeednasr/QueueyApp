import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class ReportaProblem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Report a Problem",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: TextFormField(
              maxLines: 8,
              minLines: 8,
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                hintText: "Describe your problem in details ",
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Center(
                        child: SizedBox(
                      width: 111,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            width: 1.5,
                            color: Color(0xff0762FF),
                          ),
                          primary: Colors.white.withOpacity(.95), // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {
                          //access galaryyyyyyyyyyyyyyyyyyyyyyy
                        },
                        child: Text(
                          'Choose File',
                          // textAlign: TextAlign.center,

                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff0762FF)),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Upload screenshot if available",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: SizedBox(
              width: 130,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  primary: Color(0xffC83535), // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Report',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}

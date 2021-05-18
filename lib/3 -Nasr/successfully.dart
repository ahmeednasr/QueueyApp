import 'package:flutter/material.dart';

class Successfully extends StatefulWidget {
  @override
  _SuccessfullyState createState() => _SuccessfullyState();
}

class _SuccessfullyState extends State<Successfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Congratulations!',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Text('You booked a slot at .... on ...',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Successfully', style: TextStyle(fontWeight: FontWeight.bold)),
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
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: Text(
                'Done',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "QueueY",
              style: TextStyle(
                  fontSize: 48, color: Theme.of(context).primaryColor),
            ),
            Container(
              padding: EdgeInsets.all(7),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color.fromRGBO(50, 157, 156, .25)),
              child: Image(image: AssetImage('assets/images/Queue-amico.png')),
            ),
            Text(
              "Get in touch with QueueY",
              style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign Up as:",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold),
            ),
            Center(
                child: SizedBox(
              width: 150,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  primary: Theme.of(context).primaryColor, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  //User registration screennnnnnnnnnnnnnnnnn
                },
                child: Text(
                  'User',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            )),
            Center(
                child: SizedBox(
              width: 150,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  primary: Theme.of(context).primaryColor, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () {
                  //Business registration screennnnnnnnnnnnnnnnnn
                },
                child: Text(
                  'Business',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            )),
            SizedBox(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}

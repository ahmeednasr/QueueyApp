import 'package:flutter/material.dart';
import 'package:queuey/2%20-Algaraiehy/10-verification/pin_entry_text_field.dart';

class VerificationView extends StatefulWidget {
  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  // void _submitForm() {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Color.fromRGBO(50, 157, 156, .25)),
                    child: Image(
                        image: AssetImage('assets/images/Queue-amico.png')),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'QueueY',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.5,
                  ), //Border.all
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.0),
                    topLeft: Radius.circular(60.0),
                  ), //BorderRadius
                ), //BoxDecoration
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Verification',
                      style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Enter the verification code we just \nsend you on your(mail-phone)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(63, 63, 63, .66),
                      ), //TextStyle
                    ), //Expanded
                    Form(
                      child: PinEntryTextField(
                        showFieldAsBox: false,
                        onSubmit: (String pin) {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: Text("Pin"),
                          //         content: Text('Pin entered is $pin'),
                          //       );
                          //     }); //end showDialog()
                        }, // end onSubmit
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    /////////////////>>>Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.5,
                          color: Theme.of(context).primaryColor,
                        ), //BorderSide
                        primary: Colors.white, // background
                        onPrimary: Theme.of(context).primaryColor, // foreground
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ), //RoundedRectangleBorder
                      ), //ElevatedButton.styleFrom
                      onPressed: () {
                        // _submitForm();
                      }, //onPressed
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ), //TextStyle
                        ), //Text
                      ), //Padding
                    ), //ElevatedButton
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "If you didn't recieve the code...! ",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff3F3F3F),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //Column
              ), //Container
            ],
          ), //ListView
        ],
      ), //Stack
    ); //Scaffold
  }
}

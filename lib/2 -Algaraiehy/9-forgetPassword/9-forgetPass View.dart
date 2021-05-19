import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queuey/2%20-Algaraiehy/10-verification/10-verification%20View.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _emailorPhone;
  Widget _textField({String hint, Function validate, Function onSave}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
        ],
        onSaved: onSave,
        keyboardType: TextInputType.text,
        validator: validate,
        controller: null,
        style: TextStyle(
          color: Color(0xff666666),
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color(0xff329D9C),
            size: 35,
          ),
          hintText: 'Email or phone',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromRGBO(102, 102, 102, 0.40),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Color.fromRGBO(102, 102, 102, 0.40),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => VerificationView()));
    }
  }

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
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Enter the mail or phone number \nassociated with your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(63, 63, 63, .66),
                      ), //TextStyle
                    ), //Expanded

                    Form(
                      key: _formKey,
                      child: _textField(
                        hint: "Email or phone",
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Email is required';
                          } //if
                          else {
                            return null;
                          } //else
                        }, //validate
                        onSave: (value) {
                          setState(() {
                            _emailorPhone = value;
                            print(_emailorPhone);
                          }); //setState
                        }, //onSave
                      ), //_textField
                    ), //Form
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 1.5,
                            color: Theme.of(context).primaryColor,
                          ),
                          primary: Colors.white, // background
                          onPrimary:
                              Theme.of(context).primaryColor, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        _submitForm();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Container
            ],
          ), //ListView
        ],
      ), //Stack
    ); //Scaffold
  }
}

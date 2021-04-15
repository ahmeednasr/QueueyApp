import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

bool _issecured = true;

class _LoginViewState extends State<LoginView> {
  Widget textField({
    String hinttext,
    Widget prefixIcon,
    Function validator,
    Function onsave,
    bool secure,
    Widget suffixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        //validator: validator,
        obscureText: secure,
        //onSaved: onsave,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            hintText: hinttext,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
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
              Text(
                'Q',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 48,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          textField(
              hinttext: 'Enter your full name',
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              secure: false),
          SizedBox(
            height: 20,
          ),
          textField(
              hinttext: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              suffixIcon: IconButton(
                icon:
                    Icon(_issecured ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _issecured = !_issecured;
                  });
                },
                color: Theme.of(context).primaryColor,
              ),
              secure: _issecured),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: InkWell(
              onTap: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page()));*/
              },
              child: Text(
                'Forget password?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
              child: RaisedButton(
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Text(
              'sign in',
              style: TextStyle(color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}

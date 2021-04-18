import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

bool _issecured = true;
GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String _email, _password;

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
        validator: validator,
        obscureText: secure,
        onSaved: onsave,
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

  _socialIcon({String image}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
          )),
    );
  }

  _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    } else {
      _formkey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0, automaticallyImplyLeading: false, toolbarHeight: 0),
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
                'QueueY',
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
          Form(
            key: _formkey,
            child: Column(
              children: [
                textField(
                    validator: (value) {
                      if (value.toString().isEmpty ||
                          value.toString().length < 10) {
                        return "email is required";
                      } else {
                        return null;
                      }
                    },
                    onsave: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    hinttext: 'Email',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    secure: false),
                SizedBox(
                  height: 20,
                ),
                textField(
                    validator: (value) {
                      if (value.toString().isEmpty ||
                          value.toString().length < 10) {
                        return "password is required and more than 10 characters";
                      } else {
                        return null;
                      }
                    },
                    onsave: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    hinttext: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _issecured ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _issecured = !_issecured;
                        });
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                    secure: _issecured),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: InkWell(
              onTap: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page()));*/
              },
              child: Text(
                'Forget password?',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor, // background
              onPrimary: Colors.black, // foreground
            ),
            onPressed: () {
              _submitForm();
              print("$_email $_password");
            },
            child: Text(
              'sign in',
              style: TextStyle(color: Colors.white),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(image: 'assets/images/Screens/8-signin/face.png'),
              SizedBox(
                width: 10,
              ),
              _socialIcon(image: 'assets/images/Screens/8-signin/google.png'),
              SizedBox(
                width: 10,
              ),
              _socialIcon(image: 'assets/images/Screens/8-signin/twitter.png')
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Center(
            child: Column(
          children: [
            Text("Don't have account?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("click here "),
                InkWell(
                  onTap: () {
                    /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen()));*/
                  },
                  child: Text(
                    "(create an account)",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

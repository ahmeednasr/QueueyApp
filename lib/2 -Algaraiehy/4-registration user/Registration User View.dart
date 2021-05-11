import 'package:flutter/material.dart';
import 'package:queuey/2%20-Algaraiehy/4-registration%20user/Registration%20User%20Controller.dart';
import 'package:queuey/2%20-Algaraiehy/4-registration%20user/Registration%20User%20Model.dart';
import 'package:queuey/2%20-Algaraiehy/5-congrats.dart';

class RegistrationUserView extends StatefulWidget {
  @override
  _RegistrationUserViewState createState() => _RegistrationUserViewState();
}

GlobalKey<FormState> _formkey = GlobalKey<FormState>();
// ignore: unused_element
String _name, _email, _phone, _password, _confirmpassword;

RegistrationUserController _controller = new RegistrationUserController();
bool _issecured = true;

class _RegistrationUserViewState extends State<RegistrationUserView> {
  Widget textField({
    TextInputType keyboardType,
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
        keyboardType: keyboardType,
        validator: validator,
        obscureText: secure,
        onSaved: onsave,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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

  RegistrationUserModel _model = new RegistrationUserModel();
  bool _load = false;
  _submitForm() async {
    if (!_formkey.currentState.validate()) {
      return;
    } else {
      _formkey.currentState.save();
      setState(() {
        _load = true;
      });
      _model = await _controller.registrationUser(
        fullName: _name,
        email: _email,
        phone: _phone,
        password: _password,
      );
      setState(() {
        _load = false;
      });
      if (_model == null) {
        final snackBar =
            SnackBar(content: Text('Erorr try another email or phone number'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      if (_model.errNum == '201') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Congrats()));
      }
    }
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
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.fromRGBO(50, 157, 156, .25)),
                child:
                    Image(image: AssetImage('assets/images/Queue-amico.png')),
              ),
              SizedBox(height: 15),
              Text('Create an Account',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 35)),
            ],
          ),
          SizedBox(height: 20),
          Form(
            key: _formkey,
            child: Column(
              children: [
                textField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 3) {
                      return "name is required and more than 3 characters";
                    }
                    return null;
                  },
                  onsave: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  hinttext: 'Enter your full name',
                  prefixIcon:
                      Icon(Icons.person, color: Theme.of(context).primaryColor),
                  secure: false,
                ), //name
                textField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 10) {
                      return "e-mail is required and more than 10 characters";
                    } else if (!value.contains('@')) {
                      return 'e-mail is invalid!';
                    } else {
                      return null;
                    }
                  },
                  onsave: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  hinttext: 'Enter your E-mail',
                  prefixIcon: Icon(Icons.email_outlined,
                      color: Theme.of(context).primaryColor),
                  secure: false,
                ), //_email
                textField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 11) {
                      return "phone number is required";
                    }
                    return null;
                  },
                  onsave: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                  hinttext: 'phone number',
                  prefixIcon:
                      Icon(Icons.phone, color: Theme.of(context).primaryColor),
                  secure: false,
                ), //_phone
                textField(
                  keyboardType: TextInputType.text,
                  hinttext: 'Password',
                  prefixIcon:
                      Icon(Icons.lock, color: Theme.of(context).primaryColor),
                  suffixIcon: IconButton(
                      icon: Icon(
                          _issecured ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _issecured = !_issecured;
                        });
                      },
                      color: Theme.of(context).primaryColor),
                  secure: _issecured,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 10) {
                      return 'password is required and more than 10 characters';
                    } else {
                      return null;
                    }
                  },
                  onsave: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                textField(
                  keyboardType: TextInputType.text,
                  hinttext: 'Confirm Password',
                  prefixIcon:
                      Icon(Icons.lock, color: Theme.of(context).primaryColor),
                  suffixIcon: IconButton(
                      icon: Icon(
                          _issecured ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _issecured = !_issecured;
                        });
                      },
                      color: Theme.of(context).primaryColor),
                  secure: _issecured,
                  validator: (value) {
                    if (value.toString().isEmpty ||
                        value.toString().length < 10) {
                      return 'confirmation password is required and more than 10 characters';
                    }
                    if (_confirmpassword != _password) {
                      return 'confirmation password does not matched';
                    } else {
                      return null;
                    }
                  },
                  onsave: (value) {
                    setState(() {
                      _confirmpassword = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
              child: SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                primary: Theme.of(context).primaryColor, // background
                onPrimary: Colors.black, // foreground
              ),
              onPressed: () {
                _submitForm();
              },
              child: _load
                  ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'or sign up using...',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30, top: 15),
            child: Center(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(
                        image: 'assets/images/Screens/8-signin/face.png'),
                    SizedBox(
                      width: 10,
                    ),
                    _socialIcon(
                        image: 'assets/images/Screens/8-signin/google.png'),
                    SizedBox(
                      width: 10,
                    ),
                    _socialIcon(
                        image: 'assets/images/Screens/8-signin/twitter.png')
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

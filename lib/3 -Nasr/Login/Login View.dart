import 'package:flutter/material.dart';
import 'package:queuey/1%20-AbdAlmonem/3-user%20business.dart';
import 'package:queuey/2%20-Algaraiehy/11-login%20successfull.dart';
import 'package:queuey/2%20-Algaraiehy/9-forgetPassword/9-forgetPass%20View.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20Controller.dart';
import 'package:queuey/3%20-Nasr/Login/Login%20Model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

bool _issecured = true;
GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String _email, _password;
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginSuccessfull(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _LoginViewState extends State<LoginView> {
  Widget _textField({
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

  _errorDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'OOPS!',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Some thing went wrong..\nlet's try again",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff3F3F3F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFF0000), // background
                          onPrimary: Colors.black, // foreground
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        child: Text(
                          'Try Again',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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

  LoginController _controller = new LoginController();
  LoginModel _model = new LoginModel();

  bool _load = false;
  _submitForm() async {
    if (!_formkey.currentState.validate()) {
      return;
    } else {
      _formkey.currentState.save();
      setState(() {
        _load = true;
      });

      _model = await _controller.login(email: _email, password: _password);
      setState(() {
        _load = false;
      });
      if (_model.errNum == "201") {
        Navigator.of(context).pushReplacement(_createRoute());
      }
      if (_model.errNum == "404") {
        _errorDialog();
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
              SizedBox(
                height: 10,
              ),
              Text(
                'QueueY',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  // fontStyle: FontStyle.italic,
                  fontSize: 48,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                _textField(
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
                _textField(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text(
                'Forget password?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: SizedBox(
            width: 100,
            height: 45,
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
                      'sign in',
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          )),
          SizedBox(
            height: 40,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        height: 120,
        child: Center(
            child: Column(
          children: [
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
            ),
            Expanded(child: SizedBox()),
            Column(
              children: [
                Text("Don't have account?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("click here "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserBusiness()));
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
            ),
          ],
        )),
      ),
    );
  }
}

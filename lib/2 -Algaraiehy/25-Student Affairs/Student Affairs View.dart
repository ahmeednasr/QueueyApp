import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class StudentAffairsView extends StatefulWidget {
  @override
  _StudentAffairsViewState createState() => _StudentAffairsViewState();
}

class _StudentAffairsViewState extends State<StudentAffairsView> {
  _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
  }

  // ignore: unused_field
  String _name, _id, _email, _inquiry;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _textField({
    TextInputType keyboardType,
    String labelText,
    int minLines,
    int maxLines,
    Function validator,
    // bool secure,
    Function onsave,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyboardType,
            validator: validator,
            // obscureText: secure,
            onSaved: onsave,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 1.5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 1.5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black54, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2)),
              labelText: labelText,
              labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            ),
            style: TextStyle(color: Colors.black87, fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'Name',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _textField(
          keyboardType: TextInputType.text,
          onsave: (value) {
            setState(() {
              _name = value;
            });
          }, //onsave
          // secure: false,
          validator: (value) {
            if (value.toString().isEmpty ||
                        value.toString().length < 2) {
              return "name is required and more than 2 characters";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'ID Number',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _textField(
          keyboardType: TextInputType.number,
          onsave: (value) {
            setState(() {
              _id = value;
            });
          },
          // secure: false,
          validator: (value) {
            if (value.toString().isEmpty ||
                        value.toString().length < 2) {
              return "ID Number is required and more than 2 characters";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'E-mail',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _textField(
          keyboardType: TextInputType.emailAddress,
          onsave: (value) {
            setState(() {
              _email = value;
            });
          },
          // secure: false,
          validator: (value) {
            if (value.toString().isEmpty ||
                        value.toString().length < 10) {
              return 'email is required and more than 10 characters';
            } else {
              return null;
            }
          }, //validator
        ),
      ],
    );
  }

  Widget _buildInquiry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'Inquiry',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Stack(
          children: [
            TextFormField(
              minLines: 6,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              validator: (value) {
                return null;
              }, //validator
              obscureText: false,
              onSaved: (value) {
                setState(() {
                  _inquiry = value;
                });
              }, //onsave,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black54, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2)),
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            Positioned(
                right: 10,
                bottom: 5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.red,
                      elevation: 0,
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      side: BorderSide(
                        color: Colors.red,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          13,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Upload a document'))),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: _formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildName(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildID(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildEmail(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildInquiry(),
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: SizedBox(
                    width: 120,
                    height: 50,
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
                        if (_formkey.currentState.validate()) {
                          // Navigator.push(context,MaterialPageRoute(builder: (context) => /*paggge*/()));
                        }
                        _formkey.currentState.save();
                        print('$_name $_id $_email $_inquiry');
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

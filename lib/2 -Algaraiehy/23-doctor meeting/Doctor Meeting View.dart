import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';
import 'package:intl/intl.dart'; // for DateFormat('yyyy/MM/dd')

class DoctorMeetingView extends StatefulWidget {
  @override
  _DoctorMeetingViewState createState() => _DoctorMeetingViewState();
}

class _DoctorMeetingViewState extends State<DoctorMeetingView> {
  _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();
  DateTime date;
  String _name,
      _id,
      _meetingTopic,
      _bookingDay,
      _slotTime,
      slotsChosse;
      // dropdownValue;
  // _chosenValue

  // List listItems = ['09:00 - 09:30', '09:30 - 10:00', '01:00 - 01:30'];
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _suffixIcon() {
    return IconButton(
      icon: Icon(
        Icons.arrow_drop_down,
        size: 35,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {},
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }



  Widget _textField({
    // DropdownButtonFormField dropDown,
    TextInputType keyboardType,
    String labelText,
    int minLines,
    int maxLines,
    Function validator,
    Widget suffixIcon,
    Function onsave,
    Function ontap,
    TextEditingController controller,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            onTap: ontap,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onsave,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 1.5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.5)),
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
          validator: (value) {
            if (value.toString().isEmpty || value.toString().length < 2) {
              return "name is required and more than 2 characters";
            }
            return null;
          },
        ),
      ],
    );
  } //_buildName()

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
          validator: (value) {
            if (value.toString().isEmpty || value.toString().length < 2) {
              return "ID Number is required and more than 2 characters";
            }
            return null;
          },
        ),
      ],
    );
  } //_buildID()

  Widget _buildMeetingTopic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'Meeting Topic',
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
              _meetingTopic = value;
            });
          },
          validator: (value) {
            if (value.toString().isEmpty || value.toString().length < 10) {
              return 'Meeting Topic is required and more than 10 characters';
            } else {
              return null;
            }
          }, //validator
        ),
      ],
    );
  } //_buildMeetingTopic()

  Widget _buildBookingDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'Booking day',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _textField(
          controller: _textEditingController,
          ontap: () async {
            // Below line stops keyboard from appearing
            FocusScope.of(context).requestFocus(new FocusNode());
            // Show Date Picker Here
            await _selectDate(context);
            _textEditingController.text = DateFormat('yyyy/MM/dd').format(date);
            //setState(() {});
          },
          suffixIcon: _suffixIcon(),
          onsave: (value) {
            setState(() {
              _bookingDay = value;
            });
          },
          validator: (value) {
            if (value.toString().isEmpty /*|| value.toString().length < 10*/) {
              return 'Booking day is required';
            } else {
              return null;
            }
          }, //validator
        ),
      ],
    );
  } //_buildBookingDay()

  Widget _buildSlotTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          child: Text(
            'Slot time',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _textField(
          // dropDown: MyDropDown(),
          suffixIcon: _suffixIcon(),
          onsave: (value) {
            setState(() {
              _slotTime = value;
            });
          },
          validator: (value) {
            if (value.toString().isEmpty /*|| value.toString().length < 10*/) {
              return 'Slot time is required';
            } else {
              return null;
            }
          }, //validator
        ),
      ],
    );
  } //_buildSlotTime()

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
                    child: _buildMeetingTopic(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildBookingDay(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildSlotTime(),
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
                        print(
                            '$_name $_id $_meetingTopic $_bookingDay $_slotTime');
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

// class Slots {
//   int index;
//   String times;

//   Slots(this.index, this.times);

//   static List<Slots> getCompanies() {
//     return <Slots>[
//       Slots(0, '09:00 - 09:30'),
//       Slots(1, '09:30 - 10:00'),
//       Slots(2, '01:00 - 01:30'),
//     ];
//   }
// }

// class MyDropDown extends StatefulWidget {
//   const MyDropDown({
//     Key key,
//   }) : super(key: key);

//   @override
//   _MyDropDownState createState() => _MyDropDownState();
// }

// class _MyDropDownState extends State<MyDropDown> {
//   String selected;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: selected,
//       items: ["A", "B", "C"]
//           .map((label) => DropdownMenuItem(
//                 child: Text(label),
//                 value: label,
//               ))
//           .toList(),
//       onChanged: (value) {
//         setState(() => selected = value);
//       },
//     );
//   }
// }
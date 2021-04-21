import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class CSDoctors extends StatefulWidget {
  @override
  _CSDoctorsState createState() => _CSDoctorsState();
}

class _CSDoctorsState extends State<CSDoctors> {
  List<String> _doctorsNames = [
    "Dr/samir El-mogy",
    "Dr/Magdy Zakrya",
    "Dr/Mohamed El-rahmawy",
    "Dr/Osama AboElnasr",
    "Dr/Abdelaziz said",
    "Dr/sara Metwally",
    "Dr/Waleed Al-Adrosy",
    "Dr/Mohamed Hagag",
    "Dr/Reem El-deeb",
    "Dr/sherihan Mohamed ",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        _doctorsNames[index],
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: _doctorsNames.length,
        ),
      ),
    );
  }
}

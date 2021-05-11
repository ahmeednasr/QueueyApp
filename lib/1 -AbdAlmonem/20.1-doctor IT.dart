import 'package:flutter/material.dart';

class ItDoctors extends StatefulWidget {
  @override
  _ItDoctorsState createState() => _ItDoctorsState();
}

class _ItDoctorsState extends State<ItDoctors> {
  List<String> _doctorsNames = [
    "Dr/Noha Hikal",
    "Dr/Hassan soliman",
    "Dr/Mostafa Algayar",
    "Dr/Mohamed Elmogy",
    "Dr/Fatma Elzahraa",
    "Dr/Nehal Sakr",
    "Dr/Eman Eldidamony",
    "Dr/Reham Mostafa",
    "Dr/Nagham Mekky",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Scrollbar(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      ),
    );
  }
}

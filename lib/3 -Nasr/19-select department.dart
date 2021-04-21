import 'package:flutter/material.dart';
import 'package:queuey/1%20-AbdAlmonem/20.1-doctor%20IT.dart';
import 'package:queuey/1%20-AbdAlmonem/20.2-doctor%20CS.dart';
import 'package:queuey/1%20-AbdAlmonem/20.3-doctor%20IS.dart';
import 'package:queuey/1%20-AbdAlmonem/20.4%20Defult%20Screen.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class SelectDepartment extends StatefulWidget {
  @override
  _SelectDepartmentState createState() => _SelectDepartmentState();
}

class _SelectDepartmentState extends State<SelectDepartment> {
  List<Map> _departmentList = [
    {
      'department': 'Information Technology',
      'image': 'assets/images/Screens/19-select department/IT.png',
      'Screen': ItDoctors()
    },
    {
      'department': 'Computer Science',
      'image': 'assets/images/Screens/19-select department/CS.png',
      'Screen': CSDoctors()
    },
    {
      'department': 'Information Systems',
      'image': 'assets/images/Screens/19-select department/IS.png',
      'Screen': ISDoctors()
    },
    {
      'department': 'Software Engineering',
      'image': 'assets/images/Screens/19-select department/SW.png',
      'Screen': DefultScreen()
    },
    {
      'department': 'Bioinformatics',
      'image': 'assets/images/Screens/19-select department/Bio.png',
      'Screen': DefultScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select Department',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _departmentList.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200]),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        _departmentList[index]['Screen']));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image: AssetImage(
                                      _departmentList[index]['image']),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _departmentList[index]['department'],
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class SelectDepartment extends StatefulWidget {
  @override
  _SelectDepartmentState createState() => _SelectDepartmentState();
}

class _SelectDepartmentState extends State<SelectDepartment> {
  List<Map> _departmentList = [
    {
      'department': 'Information Technology',
      'image': 'assets/images/Screens/19-select department/IT.png'
    },
    {
      'department': 'Computer Science',
      'image': 'assets/images/Screens/19-select department/CS.png'
    },
    {
      'department': 'Information Systems',
      'image': 'assets/images/Screens/19-select department/IS.png'
    },
    {
      'department': 'Software Engineering',
      'image': 'assets/images/Screens/19-select department/SW.png'
    },
    {
      'department': 'Bioinformatics',
      'image': 'assets/images/Screens/19-select department/Bio.png'
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
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  AssetImage(_departmentList[index]['image']),
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
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

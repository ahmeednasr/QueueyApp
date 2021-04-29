import 'package:flutter/material.dart';
import 'package:queuey/3%20-Nasr/11-book%20Q%20now.dart';
import 'package:queuey/Custom_Widget/MyAppBar.dart';

class BookSlitView extends StatefulWidget {
  @override
  _BookSlitViewState createState() => _BookSlitViewState();
}

class _BookSlitViewState extends State<BookSlitView> {
  List<Map> _times = [
    {
      'name': 'sat \n14 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
    {
      'name': 'sun \n15 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
    {
      'name': 'mon \n16 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
    {
      'name': 'tu \n17 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
    {
      'name': 'we \n16 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
    {
      'name': 'th \n16 Mar',
      'time': [
        '8-8:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
        '9-9:30',
      ]
    },
  ];

  List<String> _time = [
    '8-8:30',
    '9-9:30',
    '9-9:30',
    '9-9:30',
    '9-9:30',
    '9-9:30',
  ];
  _day({String name}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ))),
    );
  }

  _circle({bool status}) {
    return InkWell(
      onTap: () {
        if (status) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookQNow()));
        }
      },
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: status ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _getColumnTime(List<String> yourList) {
    return Row(
        children: yourList
            .map((i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(i),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffCAE6E5),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [_getColumnTime(_time)],
                )

                /*  DataTable(
                  showBottomBorder: false,
                  columnSpacing: 15,
                  columns: [
                    DataColumn(label: Text("Time")),
                    DataColumn(label: _day(name: _times[0]['name'])),
                    DataColumn(label: _day(name: _times[1]['name'])),
                    DataColumn(label: _day(name: _times[2]['name'])),
                    DataColumn(label: _day(name: _times[3]['name'])),
                    DataColumn(label: _day(name: _times[4]['name'])),
                    DataColumn(label: _day(name: _times[5]['name'])),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text(_times[0]['time'][0])),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: false)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_times[0]['time'][1])),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: false)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_times[0]['time'][3])),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: false)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(_times[0]['time'][4])),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: false)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                      DataCell(_circle(status: true)),
                    ]),
                  ]),*/
                ),
          ),
        ),
      ),
    );
  }
}

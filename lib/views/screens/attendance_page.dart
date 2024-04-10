import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:srm_attendance/views/screens/login_page.dart';

import '../../main.dart';
import '../common_drawer.dart';
import 'analytics_page.dart';
import 'faculties_page.dart';
import 'odml_page.dart'; // Add this import for date formatting

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> _students = [
    {
      'registerNumber': '001',
      'name': 'John Doe',
      'totalClasses': 30,
      'classesJoined': 28,
      'percentage': 93.3,
      'odMl': '2',
    },
    // Add more student data here...
  ];

  // Method to get the formatted date and day
  String _getFormattedDate() {
    var now = DateTime.now();
    var formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(now); // e.g., Wed, Apr 6, 2022
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/srm_logo.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            Container(padding: const EdgeInsets.all(8.0), child: Text('Attendance'))
          ],
        ),
      ),
      drawer: CommonDrawer(onDrawerItemTap: (index) {
        // Handle drawer item taps
        switch (index) {
          case 0:
          // Navigate to Attendance Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AttendancePage()));
            break;
          case 1:
          // Navigte to Faculties Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AnalyticsPage()));
            break;
          case 2:
          // Navigate to Faculties Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => FacultiesPage()));
            break;
          case 3:
          // Navigate to Faculties Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => StudentsODMLPage()));
            break;
          case 4:
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInPage()));
            break;
        }
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Course: Advanced Flutter\nDate: ${_getFormattedDate()}\nDay Order: 2\nTime: ${DateFormat('hh:mm a').format(DateTime.now())}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Day Order')),
                DataColumn(label: Text('Register Number')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Total Classes')),
                DataColumn(label: Text('Classes Joined')),
                DataColumn(label: Text('Percentage')),
                DataColumn(label: Text('OD/ML')),
                DataColumn(label: Text('Venue')),
              ],
              rows: _students
                  .map(
                    (student) => DataRow(cells: <DataCell>[
                  DataCell(Text('2')), // Dummy day order, replace with actual data
                  DataCell(Text(student['registerNumber'])),
                  DataCell(Text(student['name'])),
                  DataCell(Text(student['totalClasses'].toString())),
                  DataCell(Text(student['classesJoined'].toString())),
                  DataCell(Text('${student['percentage']}%')),
                  DataCell(Text(student['odMl'])),
                  DataCell(Text('Room 101')), // Dummy venue, replace with actual data
                ]),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

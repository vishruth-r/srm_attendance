import 'package:flutter/material.dart';
import 'package:srm_attendance/views/screens/analytics_page.dart';
import 'package:srm_attendance/views/screens/attendance_page.dart';
import 'package:srm_attendance/views/screens/faculties_page.dart';

import '../common_drawer.dart';
class StudentsODMLPage extends StatefulWidget {
  @override
  _StudentsODMLPageState createState() => _StudentsODMLPageState();
}

class _StudentsODMLPageState extends State<StudentsODMLPage> {
  late String _name;
  late String _registrationNumber;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Set initial selected date to current date
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students OD/ML'),
      ),
      drawer: CommonDrawer(onDrawerItemTap: (index) {
        // Handle drawer item taps
        switch (index) {
          case 0:
          // Navigate to Attendance Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AttendancePage()));
            break;
          case 1:
          // Navigate to Analytics Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AnalyticsPage()));
            break;
          case 2:
          // Navigate to Faculties Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => FacultiesPage()));
            break;
          case 3:
          // Already on Students OD/ML Page, no need to navigate
            break;
          case 4:
          // Handle logout functionality
            break;
        }
      }),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Registration Number'),
              onChanged: (value) {
                setState(() {
                  _registrationNumber = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Date: ${_selectedDate.toString().substring(0, 10)}'),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle file upload
              },
              child: Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}

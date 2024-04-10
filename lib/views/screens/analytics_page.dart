import 'package:flutter/material.dart';
import 'package:srm_attendance/views/screens/attendance_page.dart';
import 'package:srm_attendance/views/screens/faculties_page.dart';
import '../common_drawer.dart';
import 'odml_page.dart'; // Import the common drawer widget

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      drawer: CommonDrawer(onDrawerItemTap: (index) {
        // Handle drawer item taps
        switch (index) {
          case 0:
          // Navigate to Attendance Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AttendancePage()));
            break;
          case 1:
          // Already on Analytics Page, no need to navigate
            break;
          case 2:
          // Navigate to Faculties Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => FacultiesPage()));
            break;
          case 3:
          // Navigate to Students OD/ML Page
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => StudentsODMLPage()));
            break;
          case 4:
          // Handle logout functionality
            break;
        }
      }),
      body: Center(
        child: Text(
          'Analytics Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

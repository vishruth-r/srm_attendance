import 'package:flutter/material.dart';
import 'package:srm_attendance/views/common_drawer.dart';
import 'package:srm_attendance/views/screens/attendance_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendancePage()
    );
  }
}

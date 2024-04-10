import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:srm_attendance/views/screens/odml_page.dart';

import '../common_drawer.dart';
import '../screens/attendance_page.dart';
import '../screens/faculties_page.dart';
import '../screens/login_page.dart';

class Student {
  final String name;
  final double attendance;

  Student({required this.name, required this.attendance});
}

class SubjectAttendance {
  final String subject;
  final double attendance;

  SubjectAttendance({required this.subject, required this.attendance});
}

class AnalyticsPage extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'John', attendance: 80),
    Student(name: 'Alice', attendance: 70),
    Student(name: 'Bob', attendance: 90),
    Student(name: 'Emily', attendance: 60),
    Student(name: 'Jack', attendance: 85),
  ];

  final List<SubjectAttendance> subjects = [
    SubjectAttendance(subject: 'Math', attendance: 70),
    SubjectAttendance(subject: 'Science', attendance: 80),
    SubjectAttendance(subject: 'English', attendance: 75),
    SubjectAttendance(subject: 'History', attendance: 90),
    SubjectAttendance(subject: 'Geography', attendance: 65),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      drawer: CommonDrawer(
        onDrawerItemTap: (index) {
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
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Overall Attendance'),
            Container(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: List.generate(
                    students.length,
                        (index) => PieChartSectionData(
                      value: students[index].attendance,
                      title: students[index].name,
                      color: getColor(students[index].attendance),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Subject-wise Attendance'),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: List.generate(
                          subjects.length,
                              (index) => PieChartSectionData(
                            value: subjects[index].attendance,
                            title: subjects[index].subject,
                            color: getColor(subjects[index].attendance),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: List.generate(
                          subjects.length,
                              (index) => PieChartSectionData(
                            value: subjects[index].attendance,
                            title: subjects[index].subject,
                            color: getColor(subjects[index].attendance),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(double attendance) {
    return attendance >= 75 ? Colors.green : Colors.red;
  }
}

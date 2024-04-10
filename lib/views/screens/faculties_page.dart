import 'package:flutter/material.dart';
import '../common_drawer.dart';

class Faculty {
  final String name;
  final String course;
  final String classTime;
  final String venue;
  final String dayOrder;

  Faculty({
    required this.name,
    required this.course,
    required this.classTime,
    required this.venue,
    required this.dayOrder,
  });
}

class FacultiesPage extends StatelessWidget {
  final List<Faculty> faculties = [
    Faculty(name: 'John Doe', course: 'Mathematics', classTime: '9:00 AM - 10:30 AM', venue: 'Room 101', dayOrder: '1'),
    Faculty(name: 'Emily Smith', course: 'Physics', classTime: '10:45 AM - 12:15 PM', venue: 'Room 102', dayOrder: '2'),
    Faculty(name: 'Michael Johnson', course: 'Biology', classTime: '1:00 PM - 2:30 PM', venue: 'Room 103', dayOrder: '4'),
    Faculty(name: 'Sophia Williams', course: 'Chemistry', classTime: '2:45 PM - 4:15 PM', venue: 'Room 104', dayOrder: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculties'),
      ),
      drawer: CommonDrawer(onDrawerItemTap: (index) {
        // Handle drawer item taps
        // You can use Navigator to navigate to different pages based on the index
      }),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Course')),
            DataColumn(label: Text('Class Time')),
            DataColumn(label: Text('Day Order')),
            DataColumn(label: Text('Venue')),
          ],
          rows: faculties
              .map(
                (faculty) => DataRow(cells: <DataCell>[
              DataCell(Text(faculty.name)),
              DataCell(Text(faculty.course)),
              DataCell(Text(faculty.classTime)),
              DataCell(Text(faculty.dayOrder)),
              DataCell(Text(faculty.venue)),
            ]),
          )
              .toList(),
        ),
      ),
    );
  }
}

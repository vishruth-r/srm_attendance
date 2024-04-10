import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  final Function(int) onDrawerItemTap;

  const CommonDrawer({Key? key, required this.onDrawerItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/srm_logo.png', height: 60),
                SizedBox(height: 10),
                Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () => onDrawerItemTap(0), // Navigate to Home Page
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('Analytics'),
            onTap: () => onDrawerItemTap(1), // Navigate to Analytics Page
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Faculties'),
            onTap: () => onDrawerItemTap(2), // Navigate to Faculties Page
          ),
          ListTile(
            leading: Icon(Icons.accessibility_new),
            title: Text('Students OD/ML'),
            onTap: () => onDrawerItemTap(3), // Navigate to Students OD/ML Page
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
    );
  }
}

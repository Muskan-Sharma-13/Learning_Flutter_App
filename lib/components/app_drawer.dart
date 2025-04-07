
import 'package:flutter/material.dart';


class AppDrawer extends StatefulWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  bool _isLoading = false;
  

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return Drawer(
    //     child: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    // final User? user = Provider.of<UserProvider>(context).getUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(174, 175, 247, 1), // Soft pink
                // Color.fromRGBO(253, 221, 236, 1), // Light peach
                Color(0xFFC5DEE3), // Pale blue
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu', // Update this line
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: _buildDrawerItem(context, 'Calendar',
          //       Icons.home, CalendarScreenApp(), '/home'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: _buildDrawerItem(
          //       context,
          //       'Parent',
          //       Icons.receipt,
          //       StudyTrackerApp(),
          //       '/stress_chart'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: _buildDrawerItem(
          //       context,
          //       "Teacher",
          //       Icons.receipt,
          //       TeacherTracker(),
          //       '/summarizer'),
          // ),
          Divider(),

        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, IconData icon,
      Widget destination, String route) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      selected: widget.currentRoute == route,
      selectedTileColor: Color.fromRGBO(253, 221, 236, 1),
      onTap: () {
        if (widget.currentRoute != route) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => destination));
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}

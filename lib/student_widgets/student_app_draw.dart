import 'package:flutter/material.dart';

import '../student_screens/student_book_lessons.dart';
import '../student_screens/student_home_screen.dart';
import '../student_screens/student_chat.dart';

import '../student_screens/student_upcoming_lessons.dart';
import '../student_screens/view_homework.dart';

class StudentAppDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Student'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(StudentHomeScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Book lessons'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(StudentBookLessons.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('View upcoming lessons'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(StudentUpcomingLessons.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('View homework'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(StudentViewHomework.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Chat'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(StudentChat.routeName);
            },
          ),
          
        ],
      ),
    );
  }
}

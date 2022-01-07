import 'package:flutter/material.dart';

import '../tutor_screens/tutor_home_screen.dart';
import '../tutor_screens/tutor_book.dart';
import '../tutor_screens/set_homework.dart';
import '../tutor_screens/tutor_upcoming_lesson.dart';
import '../tutor_screens/tutor_chat.dart';

import '../tutor_screens/view_tutor_homework.dart';

class TutorAppDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Tutor'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(TutorHomeScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Book lessons'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(TutorBookLessons.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Set homework'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SetHomework.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('View homework'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(TutorViewHomework.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('View upcoming lessons'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(TutorUpcomingLessons.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Chat'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TutorChat.routeName);
            },
          ),
        ],
      ),
    );
  }
}

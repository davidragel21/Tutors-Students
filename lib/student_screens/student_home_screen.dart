import 'package:flutter/material.dart';

import 'package:student_tutor_app/main_screens/main_screen.dart';
import 'package:student_tutor_app/student_screens/student_book_lessons.dart';
import 'package:student_tutor_app/student_screens/student_upcoming_lessons.dart';
import 'package:student_tutor_app/student_screens/view_homework.dart';

import '../student_widgets/student_app_draw.dart';

class StudentHomeScreen extends StatelessWidget {
  static const routeName = './student-home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop(MainScreen.routeName);
            },
          ),
        ],
      ),
      drawer: StudentAppDraw(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(StudentUpcomingLessons.routeName);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View Lessons'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(StudentViewHomework.routeName);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View Upcoming Homework'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(StudentBookLessons.routeName);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Book Lessons'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

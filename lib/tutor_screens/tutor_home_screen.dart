import 'package:flutter/material.dart';
import 'package:student_tutor_app/tutor_screens/set_homework.dart';
import 'package:student_tutor_app/tutor_screens/tutor_book.dart';
import 'package:student_tutor_app/tutor_screens/tutor_upcoming_lesson.dart';
import 'package:student_tutor_app/tutor_screens/view_tutor_homework.dart';

import '../main_screens/main_screen.dart';
import '../tutor_widgets/tutor_app_draw.dart';

class TutorHomeScreen extends StatelessWidget {
  static const routeName = './tutor-home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop(MainScreen.routeName);
            },
          )
        ],
      ),
      drawer: TutorAppDraw(),
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
                        .popAndPushNamed(TutorUpcomingLessons.routeName);
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
                        .popAndPushNamed(TutorViewHomework.routeName);
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
                        .popAndPushNamed(TutorBookLessons.routeName);
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
            Divider(),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(SetHomework.routeName);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Set Homework'),
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

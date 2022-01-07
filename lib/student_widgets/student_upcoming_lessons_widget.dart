import 'package:flutter/material.dart';

class StudentUpcomingLessonsWidget extends StatelessWidget {
  final String id;
  final String dateTime;
  final String studentDetails;
  final String tutorDetails;

  StudentUpcomingLessonsWidget(
      this.id, this.dateTime, this.studentDetails, this.tutorDetails);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('Lesson details:'),
        title: Card(
          child: Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(dateTime),
                      Text(studentDetails),
                      Text(tutorDetails),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

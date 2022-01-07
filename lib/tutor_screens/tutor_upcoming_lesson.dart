import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../tutor_widgets/tutor_app_draw.dart';

class TutorUpcomingLessons extends StatelessWidget {
  static const routeName = './tutor-upcominglessons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upcoming lessons'),
        ),
        drawer: TutorAppDraw(),
        body: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (ctx, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return StreamBuilder(
                stream: Firestore.instance.collection('booking').snapshots(),
                builder: (ctx, homeworkSnapshot) {
                  if (homeworkSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: homeworkSnapshot.data.documents.length,
                      itemBuilder: (ctx, index) => Lesson(
                            homeworkSnapshot.data.documents[index]
                                ['studentName'],
                            homeworkSnapshot.data.documents[index]['tutorName'],
                            homeworkSnapshot.data.documents[index]['username'],
                            homeworkSnapshot.data.documents[index]
                                ['bookingTime'],
                            key: ValueKey(homeworkSnapshot
                                .data.documents[index].documentID),
                          ));
                });
          },
        ));
  }
}

class Lesson extends StatelessWidget {
  Lesson(this.studentName, this.tutorName, this.username, this.bookingTime,
      {this.key});

  final String studentName;
  final String tutorName;
  final String username;
  final String bookingTime;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {},
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Student Name: $studentName'),
                    Divider(),
                    Text('Tutor Name: $tutorName'),
                    Divider(),
                    Text('Lesson Date: $bookingTime'),
                    Divider(),
                    Text('Booked by: $username'),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

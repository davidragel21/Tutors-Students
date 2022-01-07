import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../tutor_widgets/tutor_app_draw.dart';

class TutorViewHomework extends StatelessWidget {
  static const routeName = '/tutors-homework';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Homework'),
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
                stream: Firestore.instance.collection('homework').snapshots(),
                builder: (ctx, homeworkSnapshot) {
                  if (homeworkSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: homeworkSnapshot.data.documents.length,
                      itemBuilder: (ctx, index) => Homework(
                            homeworkSnapshot.data.documents[index]
                                ['homeworkDescription'],
                            homeworkSnapshot.data.documents[index]['username'],
                            homeworkSnapshot.data.documents[index]['dueDate'],
                            homeworkSnapshot.data.documents[index]
                                ['studentProgress'],
                            key: ValueKey(homeworkSnapshot
                                .data.documents[index].documentID),
                          ));
                });
          },
        ));
  }
}

class Homework extends StatelessWidget {
  Homework(this.homeworkInfo, this.username, this.dueDate, this.studentProgress,
      {this.key});

  final String homeworkInfo;
  final String username;
  final String dueDate;
  final String studentProgress;
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
                    Text('Homework due: $dueDate'),
                    Divider(),
                    Text('Homework set by: $username'),
                    Divider(),
                    Text('Homework Details: '),
                    Text(homeworkInfo),
                    Divider(),
                    Text('Student Progress: '),
                    Text(studentProgress),
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

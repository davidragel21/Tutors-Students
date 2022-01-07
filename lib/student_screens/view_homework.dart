import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../student_widgets/student_app_draw.dart';

class StudentViewHomework extends StatelessWidget {
  static const routeName = '/student-homework';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Homework'),
        ),
        drawer: StudentAppDraw(),
        body: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (ctx, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('homework')
                    .snapshots(), //recieves a data from the homework's collection
                builder: (ctx, homeworkSnapshot) {
                  //data is stored in this variable which can be access later in code
                  if (homeworkSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      //displays a list of bookings based on the number of homework in database
                      itemCount: homeworkSnapshot.data.documents.length,
                      itemBuilder: (ctx, index) => Homework(
                            //instantiates widget class to store data into
                            homeworkSnapshot.data.documents[index][
                                'homeworkDescription'], //retrives certain fields from each document in collection
                            homeworkSnapshot.data.documents[index]['username'],
                            homeworkSnapshot.data.documents[index]['dueDate'],
                            key: ValueKey(homeworkSnapshot
                                .data.documents[index].documentID),
                          ));
                });
          },
        ));
  }
}

class Homework extends StatelessWidget {
  Homework(this.homeworkInfo, this.username, this.dueDate, {this.key});

  final String homeworkInfo;
  final String username;
  final String dueDate;
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

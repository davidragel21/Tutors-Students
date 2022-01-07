import 'package:flutter/material.dart';

class TutorDisplayWidget extends StatelessWidget {
  final String id;
  final String fname;
  final String lname;
  final String username;
  final String paswword;
  bool isTutor;

  TutorDisplayWidget(
    this.id,
    this.fname,
    this.lname,
    this.username,
    this.paswword,
    this.isTutor,
  );

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
                      Text(fname ?? 'default value'),
                      Text(lname ?? 'default value'),
                      Text(username ?? 'default value'),
                      Text(paswword ?? 'default value'),
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

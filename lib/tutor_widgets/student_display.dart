import 'package:flutter/material.dart';

class StudentDisplayWidget extends StatelessWidget {
  final String id;
  final String fname;
  final String lname;
  final String username;
  final String paswword;
  bool isTutor;

  StudentDisplayWidget(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(fname),
            Text(lname),
            Text(username),
            Text(paswword),
          ],
        ),
      ),
    );
  }
}

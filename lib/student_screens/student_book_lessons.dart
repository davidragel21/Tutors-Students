import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../student_widgets/student_app_draw.dart';

class StudentBookLessons extends StatefulWidget {
  static const routeName = '/Student-booklesson';
  @override
  _StudentBookLessonsState createState() => _StudentBookLessonsState();
}

class _StudentBookLessonsState extends State<StudentBookLessons> {
  final _form = GlobalKey<FormState>();
  final _textInput = new TextEditingController();

  var studentName = '';
  var tutorName = '';
  var bookingTime = '';

  Future<void> _saveForm() async {
    final currentUser = await FirebaseAuth.instance.currentUser();
    final currentUserDetails = await Firestore.instance
        .collection('users')
        .document(currentUser.uid)
        .get();
    Firestore.instance.collection('booking').add({
      //adds details to the bookings collection of the database
      'username':
          currentUserDetails['username'], //appends data about current user
      'userId': currentUser.uid,
      'studentName': studentName, //appends data about bookings to the database
      'tutorName': tutorName,
      'bookingTime': bookingTime,
    });
    _textInput.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book lessons'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      drawer: StudentAppDraw(),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: ListView(
              //list of fields
              children: [
                TextFormField(
                  //field for entering student name
                  decoration: InputDecoration(labelText: 'Student Name'),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {
                      studentName =
                          value; //value entered is stored in a variable to be passed on later
                    });
                  },
                ),
                TextFormField(
                  // field for entering tutor name
                  decoration: InputDecoration(labelText: 'Tutor Name'),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {
                      tutorName =
                          value; //value entered is stored in a variable to be passed on later
                    });
                  },
                ),
                TextFormField(
                  // field for entering time of the lesson
                  decoration: InputDecoration(labelText: 'Time'),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  onChanged: (value) {
                    setState(() {
                      bookingTime =
                          value; //value entered is stored in a variable to be passed on later
                    });
                  },
                ),
                Divider(),
              ],
            ),
          )),
    );
  }
}

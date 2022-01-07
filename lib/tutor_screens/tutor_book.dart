import 'package:flutter/material.dart';

import '../tutor_widgets/tutor_app_draw.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TutorBookLessons extends StatefulWidget {
  static const routeName = '/tutor-booklesson';
  @override
  _TutorBookLessonsState createState() => _TutorBookLessonsState();
}

class _TutorBookLessonsState extends State<TutorBookLessons> {
  final _form = GlobalKey<FormState>();
  final _textInput = new TextEditingController();

  var studentName = '';
  var tutorName = '';
  var bookingTime = '';

  void _saveForm() async {
    final currentUser = await FirebaseAuth.instance.currentUser();
    final currentUserDetails = await Firestore.instance
        .collection('users')
        .document(currentUser.uid)
        .get();
    Firestore.instance.collection('booking').add({
      'username': currentUserDetails['username'],
      'userId': currentUser.uid,
      'studentName': studentName,
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
      drawer: TutorAppDraw(),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Student Name'),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {
                      studentName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Tutor Name'),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {
                      tutorName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Time'),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  onChanged: (value) {
                    setState(() {
                      bookingTime = value;
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

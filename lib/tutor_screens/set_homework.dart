import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../tutor_widgets/tutor_app_draw.dart';

class SetHomework extends StatefulWidget {
  static const routeName = '/tutor-homework';
  @override
  _SetHomeworkState createState() => _SetHomeworkState();
}

class _SetHomeworkState extends State<SetHomework> {
  final _form = GlobalKey<FormState>();
  final _textInput = new TextEditingController();

  var homeworkDescription = '';
  var dueDate = '';
  var studentProgress = '';

  Future<void> _saveForm() async {
    final currentUser = await FirebaseAuth.instance.currentUser();
    final currentUserDetails = await Firestore.instance
        .collection('users')
        .document(currentUser.uid)
        .get();
    Firestore.instance.collection('homework').add({
      //adds details to the homework collection of the database
      'username':
          currentUserDetails['username'], //appends data about current user
      'userId': currentUser.uid,
      'homeworkDescription':
          homeworkDescription, //appends data about homework to the database
      'dueDate': dueDate,
      'studentProgress': studentProgress,
    });
    _textInput.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set homework'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      drawer: TutorAppDraw(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            //list of fields
            children: [
              TextFormField(
                //field for entering homework description
                decoration: InputDecoration(labelText: 'Homework description'),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  setState(() {
                    homeworkDescription =
                        value; //value entered is stored in a variable to be passed on later
                  });
                },
              ),
              TextFormField(
                //field for entering due date
                decoration: InputDecoration(labelText: 'Due Date'),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => {
                  _saveForm(),
                },
                onChanged: (value) {
                  setState(() {
                    dueDate =
                        value; //value entered is stored in a variable to be passed on later
                  });
                },
              ),
              TextFormField(
                //field for entering student progress
                decoration: InputDecoration(labelText: 'Student Progress'),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => {
                  _saveForm(),
                },
                onChanged: (value) {
                  setState(() {
                    studentProgress =
                        value; //value entered is stored in a variable to be passed on later
                  });
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

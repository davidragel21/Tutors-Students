import 'package:flutter/material.dart';

import '../student_widgets/student_app_draw.dart';

import '../chats/messages.dart';

import 'package:student_tutor_app/chats/messages.dart';

class StudentChat extends StatefulWidget {
  static const routeName = '/Student-chat';
  @override
  _StudentChatState createState() => _StudentChatState();
}

class _StudentChatState extends State<StudentChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        drawer: StudentAppDraw(),
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: UserMessages(),
            ),
            CreateMessage(),
          ],
        )));
  }
}

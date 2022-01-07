import 'package:flutter/material.dart';
import 'package:student_tutor_app/chats/messages.dart';

import '../tutor_widgets/tutor_app_draw.dart';

class TutorChat extends StatefulWidget {
  static const routeName = '/tutor-chat';

  @override
  _TutorChatState createState() => _TutorChatState();
}

class _TutorChatState extends State<TutorChat> {
  String messagePage = '';
  String messageId = '';
  String username;

//  fetchPreference() async {
  //  username = await UserPrefrences().getUsername();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        drawer: TutorAppDraw(),
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

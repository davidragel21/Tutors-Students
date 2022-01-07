import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tutor_app/chats/message_widget.dart';

class UserMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
            stream: Firestore.instance
                .collection('usermessages')
                .orderBy('messageTime', descending: true)
                .snapshots(),
            builder: (ctx, messageSnapshot) {
              if (messageSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  reverse: true,
                  itemCount: messageSnapshot.data.documents.length,
                  itemBuilder: (ctx, index) => MessageDesign(
                        messageSnapshot.data.documents[index]['text'],
                        messageSnapshot.data.documents[index]['userId'] ==
                            futureSnapshot.data.uid,
                        messageSnapshot.data.documents[index]['username'],
                        key: ValueKey(
                            messageSnapshot.data.documents[index].documentID),
                      ));
            });
      },
    );
  }
}

class CreateMessage extends StatefulWidget {
  @override
  _CreateMessageState createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  final _textInput = new TextEditingController();
  var _userMessage = '';

  void _sendUserMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final userDetails =
        await Firestore.instance.collection('users').document(user.uid).get();
    Firestore.instance.collection('usermessages').add({
      //adds details to the user messages collection of the database
      'text':
          _userMessage, //appends data about specific messages to the database
      'messageTime': Timestamp.now(),
      'userId': user.uid,
      'username': userDetails['username'] //appends data about current user
    });
    _textInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textInput,
              decoration: InputDecoration(labelText: 'Write a new message'),
              onChanged: (message) {
                setState(() {
                  _userMessage = message;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _userMessage.trim().isEmpty ? null : _sendUserMessage,
          ),
        ],
      ),
    );
  }
}

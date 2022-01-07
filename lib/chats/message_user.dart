import 'package:flutter/material.dart'; //external packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:student_tutor_app/tutor_screens/tutor_chat.dart'; //links to other code
import 'package:student_tutor_app/tutor_widgets/tutor_app_draw.dart';

class ViewUserChat extends StatelessWidget {
  static const routeName = '/ViewChatUsers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        drawer:
            TutorAppDraw(), //the access for the side draw to access different parts of the app
        body: FutureBuilder(
          future: FirebaseAuth.instance
              .currentUser(), //grabs an instance of the current user
          builder: (ctx, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child:
                    CircularProgressIndicator(), //loading indicator displayed when data is being retreived from the database
              );
            }
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .snapshots(), //accesses the users collection of he database
                builder: (ctx, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      //following code responsible for displaying user name to the screen
                      itemCount: userSnapshot.data.documents.length,
                      itemBuilder: (ctx, index) => UserChat(
                          userSnapshot.data.documents[index]['username'],
                          key: ValueKey(
                            userSnapshot.data.documents[index].documentID,
                          )));
                });
          },
        ));
  }
}

// Following code is responsible for displaying username onto the chat screen
class UserChat extends StatelessWidget {
  UserChat(this.username, {this.key});

  final String username;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(TutorChat.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(username),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

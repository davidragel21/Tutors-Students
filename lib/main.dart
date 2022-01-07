import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:student_tutor_app/main_screens/authentication.dart';
import 'package:student_tutor_app/tutor_screens/view_tutor_homework.dart';

import './student_screens/student_home_screen.dart';

import './student_screens/student_chat.dart';

import './student_screens/student_book_lessons.dart';
import './student_screens/student_upcoming_lessons.dart';
import './student_screens/view_homework.dart';

import './tutor_screens/tutor_home_screen.dart';
import './tutor_screens/tutor_book.dart';
import './tutor_screens/set_homework.dart';
import './tutor_screens/tutor_upcoming_lesson.dart';

import './tutor_screens/tutor_chat.dart';
import './main_screens/login_screen.dart';
import './main_screens/main_screen.dart';
import './main_screens/registration_screen.dart';

import 'chats/message_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutors to Students',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return MainScreen();
            }
            return AuthScreen();
          }),
      routes: {
        MainScreen.routeName: (ctx) => MainScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
        StudentHomeScreen.routeName: (ctx) => StudentHomeScreen(),
        TutorHomeScreen.routeName: (ctx) => TutorHomeScreen(),
        StudentBookLessons.routeName: (ctx) => StudentBookLessons(),
        StudentUpcomingLessons.routeName: (ctx) => StudentUpcomingLessons(),
        StudentChat.routeName: (ctx) => StudentChat(),
        StudentViewHomework.routeName: (ctx) => StudentViewHomework(),
        TutorBookLessons.routeName: (ctx) => TutorBookLessons(),
        SetHomework.routeName: (ctx) => SetHomework(),
        TutorUpcomingLessons.routeName: (ctx) => TutorUpcomingLessons(),
        TutorChat.routeName: (ctx) => TutorChat(),
        AuthScreen.routeName: (ctx) => AuthScreen(),
        TutorViewHomework.routeName: (ctx) => TutorViewHomework(),
        ViewUserChat.routeName: (ctx) => ViewUserChat(),
      },
    );
  }
}

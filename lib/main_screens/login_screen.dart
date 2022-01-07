import 'package:flutter/material.dart';

import '../student_screens/student_home_screen.dart';
import '../main_screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = './login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(),
              Divider(),
              SizedBox(),
              RaisedButton(
                child: Text('For the mome, student'),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(StudentHomeScreen.routeName);
                },
              ),
              RaisedButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MainScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

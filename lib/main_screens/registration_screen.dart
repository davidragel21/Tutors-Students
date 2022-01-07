import 'package:flutter/material.dart';

import '../tutor_screens/tutor_home_screen.dart';
import '../main_screens/main_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = './registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Student or Tutor'),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(),
              Divider(),
              SizedBox(),
              RaisedButton(
                child: Text('For the mome, tutor screen'),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(TutorHomeScreen.routeName);
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

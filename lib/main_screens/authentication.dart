import 'package:flutter/material.dart';

import 'package:student_tutor_app/data/authentication_data.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = './authscreen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    //accepts data from other functions/classes
    String email,
    String username,
    String password,
    String isTutor,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      }); //if user wants to login, the if block is run
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            //this line uses the firebase auth package to sign in to app
            email: email,
            password:
                password); //compares to see if data entered previously by user is correct
      } else {
        //else block is run instead
        authResult = await _auth.createUserWithEmailAndPassword(
            //this lines uses firebase auth page to register details
            email: email,
            password: password); //creates an account user data entered by user
        await Firestore.instance
            .collection('users') //stores data in the users collection
            .document(authResult.user.uid)
            .setData({
          'username':
              username, //other data is stored such as username and email
          'email': email,
          'isTutor': isTutor,
        });
      }
    } on PlatformException catch (err) {
      //import flutter services package to get rid of platform exception error
      var message = 'An error occured';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
            content: Text(message), backgroundColor: Theme.of(ctx).errorColor),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}

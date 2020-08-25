import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_page.dart';
import '../../utils/auth_utils.dart';

class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  FirebaseUser user;

  @override
  Widget build(BuildContext buildContext) {
    void buttonPressed() {
      signInWithGoogle().then((user) {
        print(user);
        print(user.phoneNumber);
        print(user.displayName);
        print(user.email);
        print(user.metadata);
        print(user.hashCode);
        print(user.isEmailVerified);
        print(user.photoUrl);
        print(user.providerId);
        print(user.uid);
        Navigator.push(
            buildContext,
            MaterialPageRoute(
              builder: (context) => HomePage(user.displayName),
            ));
      }).catchError((error) => print(error));
    }

    Widget magicButton() {
      return OutlineButton(
        onPressed: buttonPressed,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/images/google_logo.png')),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Sign in Bruh!',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 25,
                      ))),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
      );
    }

    return Align(
      alignment: Alignment.center,
      child: magicButton(),
    );
  }
}

import 'package:flutter/material.dart';

import '../home_page.dart';

class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext buildContext) {
    void buttonPressed() {
      Navigator.push(
          buildContext,
          MaterialPageRoute(
            builder: (context) => HomePage(controller.text),
          ));
    }

    return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 5,
                  color: Colors.black,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.done),
                onPressed: buttonPressed,
                splashColor: Colors.lightBlue,
              ),
              labelText: "Enter your username",
            ),
            controller: this.controller,
          )),
    );
  }
}

import 'package:flutter/material.dart';

import './login_page_body.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginPageBody(),
    );
  }
}

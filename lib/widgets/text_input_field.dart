import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final Function _callback;

  TextInputField(this._callback);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // Freeing the memory?
  }

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.message,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  widget._callback(this.controller.text);
                  controller.clear();
                  FocusScope.of(buildContext).unfocus();
                },
                splashColor: Colors.lightBlue,
              ),
              labelText: "Type a message",
            ),
            controller: this.controller,
          ),
        ),
      ],
    );
  }
}

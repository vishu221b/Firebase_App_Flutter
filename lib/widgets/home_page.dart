import 'package:flutter/material.dart';

import './text_input_field.dart';
import './posts_list_view.dart';
import '../models/post.dart';


class HomePage extends StatefulWidget {
  final String textMsg;

  HomePage(this.textMsg);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [Post("Dummy Body", "dum")];

  String textMsg = "Default...";

  void createNewPost(body) {
    setState(() {
      textMsg = body;
      Post post = Post(body, widget.textMsg);
      posts.add(post);
      print(post);
      print(post.author);
      print(post.body);
      print(post.isLiked);
      print(post.likes);
      print(posts);
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: PostsList(posts),
          ),
          TextInputField(createNewPost),
        ],
      ),
    );
  }
}

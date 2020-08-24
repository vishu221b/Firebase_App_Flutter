import 'package:flutter/material.dart';

import '../models/post.dart';

class PostsList extends StatefulWidget {
  final List<Post> posts;

  PostsList(this.posts);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  void likeUnlikeThePost(Post post) {
    setState(() {
      post.likePost();
    });
  }

  // get allPostsAsWidgets {
  //   List<Widget> finalList = [];
  //   for (int i = 0; i < widget.posts.length; i++) {
  //     finalList.add(
  //       Card(
  //         margin: EdgeInsets.all(10),
  //         child: Row(
  //           children: <Widget>[
  //             Expanded(
  //               child: ListTile(
  //                 contentPadding: EdgeInsets.all(20),
  //                 title: Text(widget.posts[i].body),
  //                 subtitle: Text(widget.posts[i].author),
  //               ),
  //             ),
  //             Row(
  //               children: <Widget>[
  //                 IconButton(
  //                   icon: Icon(Icons.thumb_up),
  //                   onPressed: () {
  //                     likeUnlikeThePost(widget.posts[i]);
  //                   },
  //                 ),
  //                 Text(widget.posts[i].isLiked.toString()),
  //                 Text(widget.posts[i].likes.toString()),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //   return finalList;
  // }

  // @override
  // Widget build(BuildContext buildContext) {
  //   return ListView(
  //     children: <Widget>[...allPostsAsWidgets],
  //   );
  // }

  @override
  Widget build(BuildContext buildContext) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        List<Post> posts = widget.posts; 
        return Card(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(posts[index].body, style: TextStyle(fontSize: 18),),
                  subtitle: Text(posts[index].author),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.posts[index].likes.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: posts[index].isLiked ? Colors.teal : null,
                    splashColor: !posts[index].isLiked ? Colors.teal : null,
                    onPressed: () => likeUnlikeThePost(posts[index]),
                  ),
                  // Text(widget.posts[index].isLiked.toString()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

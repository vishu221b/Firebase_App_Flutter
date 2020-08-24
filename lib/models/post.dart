class Post{
  String body;
  String author;
  var likes = 0;
  var isLiked = false;

  Post(this.body, this.author);

  void likePost(){
    this.isLiked = !this.isLiked;
    if(this.isLiked){
      this.likes += 1;
    }else{
      this.likes -= 1;
    }
  }
}

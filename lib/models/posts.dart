class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  // fromjson sa json form mn data aya ga json isa object mn convert kr da ga
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

}

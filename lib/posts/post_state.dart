class PostState {
  PostState();
}

class PostWaiting extends PostState {}

class PostLoaded extends PostState {
  List<PostsModels> listPost;

  PostLoaded(this.listPost);

  @override
  List<PostsModels> get props => [];
}

class PostFailed extends PostState {}

class PostsModels {
  int userId;
  int id;
  String title;
  String body;

  PostsModels({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModels.fromJson(Map<String, dynamic> json) => PostsModels(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

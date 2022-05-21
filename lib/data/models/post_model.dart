class PostModel {
  String? userId;
  String? userName;
  String? userImage;
  String? postId;
  String? postContent;
  String? postImage;
  String? date;
  String? time;

  PostModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.date,
    required this.time,
    this.postId = '',
    required this.postContent,
    this.postImage = '',
  });

  PostModel.fromJson(var json) {
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    date = json['date'];
    time = json['time'];
    postId = json['postId'];
    postContent = json['postContent'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userImage'] = this.userImage;
    data['date'] = this.date;
    data['time'] = this.time;
    data['postId'] = this.postId;
    data['postContent'] = this.postContent;
    data['postImage'] = this.postImage;
    return data;
  }
}

class UserModel {
  String? userId;
  late String username;
  late String email;
  late String password;
  String? image;
  String? cover;
  String? bio;

  UserModel({
    this.userId,
    required this.username,
    required this.email,
    required this.password,
    this.image,
    this.cover,
    this.bio,
  });

  UserModel.fromJson(var json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['cover'] = this.cover;
    data['bio'] = this.bio;
    return data;
  }
}

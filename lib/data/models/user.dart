class UserModel {
  String? userId;
  late String username;
  late String email;
  late String password;
  String? image;

  UserModel({
    this.userId,
    required this.username,
    required this.email,
    required this.password,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    print('this email ${this.email}');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    return data;
  }
}

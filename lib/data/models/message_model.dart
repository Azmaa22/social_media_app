class MessageModel {
  String? senderId;
  String? receiverId;
  String? messageId;
  String? messageText;
  String? dateTime;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.messageText,
    required this.dateTime,
    this.messageId = '',
  });

  MessageModel.fromJson(var json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    messageText = json['messageText'];
    dateTime = json['dateTime'];

    messageId = json['messageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['messageText'] = this.messageText;
    data['dateTime'] = this.dateTime;

    data['messageId'] = this.messageId;
    return data;
  }
}

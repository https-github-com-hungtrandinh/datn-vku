enum MessageType {
  text,
  image,
}

class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime dateTime;
  final MessageType messageType;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.dateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageType: MessageType.values[json['chatType']],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      dateTime: json['dateTime'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatType': messageType.index,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'dateTime': dateTime,
    };
  }
}

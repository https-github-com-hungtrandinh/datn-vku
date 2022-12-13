


class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime dateTime;

   Message({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.dateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      dateTime: json['dateTime'].toDate(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'dateTime': dateTime,
    };
  }
}

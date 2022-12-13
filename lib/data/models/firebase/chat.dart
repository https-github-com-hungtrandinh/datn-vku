import 'messages.dart';

class Chat {
  final String chatId;
  final List<String> userIds;
  final String? lastMessage;
  Chat({
    required this.lastMessage,
    required this.chatId,
    required this.userIds,
  });

  factory Chat.fromJson(Map<String, dynamic> json, {required String chatId}) {
    return Chat(
        lastMessage: json["lastMessage"] ,
        userIds: (json['userIds'] as List).map((e) => e.toString()).toList(),
        chatId: chatId);
  }

  Map<String, dynamic> toJson() {
    return {
      'userIds': userIds,
    };
  }
}

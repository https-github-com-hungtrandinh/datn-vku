import 'messages.dart';

class Chat {
  final String chatId;
  final List<String> userIds;
  final String lastMessage;

  // final List<Message>? messages;

  Chat({
    required this.lastMessage,
    required this.chatId,
    required this.userIds,
    // required this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json, {required String chatId}) {
    return Chat(
        lastMessage: json["lastMessage"],
        userIds: (json['userIds'] as List).map((e) => e.toString()).toList(),
        // messages: (json["messages"] as List)
        //     .reversed
        //     .map((e) => Message.fromJson(e))
        //     .toList(),
        chatId: chatId);
  }

  Map<String, dynamic> toJson() {
    return {
      'userIds': userIds,
      // 'messages': messages,
    };
  }
}

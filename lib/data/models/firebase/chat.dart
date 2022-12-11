
import 'messages.dart';

class Chat {

  final List<String> userIds;
  final List<Message>? messages;

  Chat({

    required this.userIds,
    required this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json, {String? id}) {
    List<String> userIds =
    (json['userIds'] as List).map((userId) => userId as String).toList();

    List<Message> messages = (json['messages'] as List)
        .map((message) => Message.fromJson(message))
        .toList();

    messages.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return Chat(

      userIds: userIds,
      messages: messages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userIds': userIds,
      'messages': messages,
    };
  }
}

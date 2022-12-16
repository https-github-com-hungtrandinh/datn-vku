class Chat {
  final String? chatId;
  final List<String> userIds;
  final String? lastMessage;
  final DateTime createAt;

  Chat({
    required this.createAt,
    required this.lastMessage,
    required this.chatId,
    required this.userIds,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        createAt: json["createAt"].toDate(),
        lastMessage: json["lastMessage"],
        userIds: (json['userIds'] as List).map((e) => e.toString()).toList(),
        chatId: json["groupChatId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'userIds': userIds,
    };
  }
}

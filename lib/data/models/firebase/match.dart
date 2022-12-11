import 'package:cloud_firestore/cloud_firestore.dart';

class MatchUser {
  final String uidLike;
  final String uidLiked;
  final DateTime createAt;
  final String chatId;

  MatchUser(
      {required this.uidLike, required this.uidLiked, required this.createAt, required this.chatId});

  factory MatchUser.fromDocument(DocumentSnapshot doc) {
    return MatchUser(
        chatId: doc['chatId'],
        uidLike: doc['uidLike'],
        uidLiked: doc['uidLiked'],
        createAt: DateTime.now());
  }

  Map<String, dynamic> toMap() {
    return {'uidLike': uidLike, 'uidLiked': uidLiked, 'createAt':createAt,'chatId' :chatId};
  }
}

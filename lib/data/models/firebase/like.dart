import 'package:cloud_firestore/cloud_firestore.dart';

class UserLike {
  final String uidLike;
  final List<String> uidLiked;

  UserLike({required this.uidLike, required this.uidLiked});

  factory UserLike.fromDocument(DocumentSnapshot doc) {
    return UserLike(
        uidLike: doc['uidLike'],
        uidLiked: (doc['uidLiked'] as List)
            .map((uidLiked) => uidLiked.toString())
            .toList());
  }

  Map<String, dynamic> toMap() {
    return {'uidLike': uidLike, 'uidLiked': uidLiked};
  }
}

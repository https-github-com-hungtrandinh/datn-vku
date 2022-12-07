import 'package:cloud_firestore/cloud_firestore.dart';

class UserLike {
  final String like;
  final String liked;

  UserLike({required this.like, required this.liked});

  factory UserLike.fromDocument(DocumentSnapshot doc) {
    return UserLike(like: doc['like'], liked: doc['liked']);
  }

  Map<String, dynamic> toMap() {
    return {'like': like, 'liked': liked};
  }
}

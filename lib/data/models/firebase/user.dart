import 'package:clean_architecture/data/models/firebase/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? answerId;
  String? photoUrl;
  String? email;
  String? username;
  String? phone;
  String? name;
  String? major;
  String? gender;
  List<String>? post;
  DateTime? birthday;
  bool? questionaireFilled;
  bool? registerFinished;
  bool? emailVerified;
  Location? location;
  String? status;
  List<dynamic>? interests;

  UserModel({
    this.uid,
    this.photoUrl,
    this.email,
    this.username,
    this.status,
    this.phone,
    this.name,
    this.major,
    this.location,
    this.questionaireFilled,
    this.registerFinished,
    this.emailVerified,
    this.post,
    this.gender,
    this.birthday,
    this.interests,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': "online",
      'uid': uid,
      'location': location?.toJson(),
      'photoUrl': photoUrl,
      'email': email,
      'username': username,
      'phone': phone,
      'name': name,
      'major': major,
      'mbti': post,
      'gender': gender,
      'birthday': birthday,
      'interests': interests,
      'questionaireFilled': questionaireFilled,
      'registerFinished': registerFinished,
      'emailVerified': emailVerified,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        uid: doc['uid'],
        photoUrl: doc['photoUrl'],
        email: doc['email'],
        name: doc.get('name'),
        major: doc.get('major'),
        // post: (doc.get('mbti') as List).map((post) => post.toString()).toList(),
        gender: doc.get('gender'),
        status: doc.get('status'),
        // birthday: (doc.get('birthday') as Timestamp).toDate(),
        interests: (doc['interests'] as List).map((e) => e.toString()).toList(),
        questionaireFilled: doc['questionaireFilled'],
        registerFinished: doc['registerFinished'],
        emailVerified: doc['emailVerified'],
        location: Location.fromJson(doc["location"])
    );
  }
}

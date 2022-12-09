import 'package:cloud_firestore/cloud_firestore.dart';

class Major {
  final String major;
  Major({required this.major});

  factory Major.fromJson(DocumentSnapshot documentSnapshot) {
    return Major(major: documentSnapshot['major']);
  }
}

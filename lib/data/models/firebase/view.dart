import 'package:cloud_firestore/cloud_firestore.dart';

class UserView {
  final String myUidView;
  final List<String> uidOwenView;

  UserView({required this.myUidView, required this.uidOwenView});

  factory UserView.fromDocument(DocumentSnapshot doc) {
    return  UserView(
        myUidView: doc['myUidView'],
        uidOwenView: (doc['uidOwenView'] as List)
            .map((uidOwenView) => uidOwenView.toString())
            .toList());
  }

  Map<String, dynamic> toMap() {
    return {'myUidView': myUidView, 'uidOwenView': uidOwenView};
  }
}

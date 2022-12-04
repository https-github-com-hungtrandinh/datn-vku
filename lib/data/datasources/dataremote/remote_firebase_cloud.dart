import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/firebase/user.dart';

abstract class RemoteFireBaseCloud {
  Future<void> createUser({required User user});
}

class RemoteFirebaseCloudImpl extends RemoteFireBaseCloud {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({required User user}) async {
    await firebaseFireStore.collection("user").doc(user.uid).set(user.toJson());
  }
}

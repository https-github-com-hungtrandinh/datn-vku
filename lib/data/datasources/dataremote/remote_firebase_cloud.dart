import 'package:clean_architecture/core/util/firebase_exception.dart';
import 'package:clean_architecture/data/models/firebase/personality.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../models/firebase/major.dart';
import '../../models/firebase/user.dart';

abstract class RemoteFireBaseCloud {
  Future<void> createUser({required User user});

  Future<Either<FirebaseExceptionCustom, List<Major>>> getMajor();

  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>>
      getPersonalityQuestion();
}

class RemoteFirebaseCloudImpl extends RemoteFireBaseCloud {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({required User user}) async {
    await firebaseFireStore.collection("user").doc(user.uid).set(user.toJson());
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<Major>>> getMajor() async {
    final List<Major> majorList = [];
    try {
      await firebaseFireStore
          .collection("major")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          majorList.add(Major.fromJson(doc));
        }
      });
      return Right(majorList);
    } on FirebaseException catch (e) {
      return left(FirebaseExceptionCustom.errorSignIn(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>>
      getPersonalityQuestion() async {
    final List<PersonalityQuestion> personalityQuestion = [];
    try {
      await firebaseFireStore
          .collection("personality")
          .orderBy("index", descending: false)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          personalityQuestion.add(PersonalityQuestion.fromDocument(doc));
        }
      });
      return Right(personalityQuestion);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom.errorSignIn(e.code));
    }
  }
}

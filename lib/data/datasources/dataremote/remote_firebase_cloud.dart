import 'dart:io';
import 'package:clean_architecture/core/util/firebase_exception.dart';
import 'package:clean_architecture/data/models/firebase/interest.dart';
import 'package:clean_architecture/data/models/firebase/lifestyle.dart';
import 'package:clean_architecture/data/models/firebase/personality.dart';
import 'package:clean_architecture/data/models/firebase/user_like.dart';
import 'package:clean_architecture/data/models/firebase/user_question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/firebase/major.dart';
import '../../models/firebase/user.dart';

abstract class RemoteFireBaseCloud {
  Future<void> createUser({required UserModel user});

  Future<Either<FirebaseExceptionCustom, List<Major>>> getMajor();

  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>>
      getPersonalityQuestion();

  Future<Either<FirebaseExceptionCustom, List<LifestyleQuestionModel>>>
      getLifeStyleQuestion();

  Future<Either<FirebaseExceptionCustom, List<InterestModel>>> getInterest();

  Future<Either<FirebaseExceptionCustom, String>> addImageProfile(
      {required String uid, required File imageFile});

  Future<Either<FirebaseExceptionCustom, void>> updateUserSelection({
    required uid,
    required String name,
    required DateTime birthday,
    required String major,
    required String gender,
    required List<String> interests,
    required String? photoUrl,
  });

  Future<Either<FirebaseExceptionCustom, void>> addUserAnswers(
      {required String uid, required UserAnswersModel userAnswersModel});

  Future<Either<FirebaseExceptionCustom, void>> userLike(
      {required UserLike userLike});

  Future<Either<FirebaseExceptionCustom, List<UserModel>>> getAllUser(
      {required String uid});

  Future<Either<FirebaseExceptionCustom, List<UserLike>>> getAllMyUserLike(
      {required String uid});

  Future<Either<FirebaseExceptionCustom, bool>> checkMatch(
      {required String like, required String liked});
}

class RemoteFirebaseCloudImpl extends RemoteFireBaseCloud {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<void> createUser({required UserModel user}) async {
    await firebaseFireStore.collection("user").doc(user.uid).set(user.toMap());
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
      return Left(FirebaseExceptionCustom.errorSignIn(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>>
      getPersonalityQuestion() async {
    final List<PersonalityQuestion> personalityQuestion = [];
    try {
      await firebaseFireStore
          .collection("personality")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          personalityQuestion.add(PersonalityQuestion.fromDocument(doc));
        }
      });
      return Right(personalityQuestion);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<LifestyleQuestionModel>>>
      getLifeStyleQuestion() async {
    final List<LifestyleQuestionModel> lifeStyle = [];
    try {
      await firebaseFireStore
          .collection("lifestyle")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          lifeStyle.add(LifestyleQuestionModel.fromDocument(doc));
        }
      });
      return Right(lifeStyle);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<InterestModel>>>
      getInterest() async {
    final List<InterestModel> interest = [];
    try {
      await firebaseFireStore
          .collection("interests")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          interest.add(InterestModel.fromDocument(doc));
        }
      });
      return Right(interest);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, void>> updateUserSelection(
      {required uid,
      required String name,
      required DateTime birthday,
      required String major,
      required String gender,
      required List<String> interests,
      required String? photoUrl}) async {
    try {
      await firebaseFireStore.collection("user").doc(uid).update({
        'name': name,
        'birthday': birthday,
        'major': major,
        'gender': gender,
        'interests': interests,
        'photoUrl': photoUrl,
        'questionaireFilled': true,
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, String>> addImageProfile(
      {required String uid, required File imageFile}) async {
    List<String> splitPath = imageFile.path.split('.');
    String filetype = splitPath[splitPath.length - 1];
    String filename = '$uid.$filetype';

    try {
      await firebaseStorage
          .ref()
          .child('images')
          .child('profile-picture')
          .child(filename)
          .putFile(imageFile);

      String downloadURL = await firebaseStorage
          .ref()
          .child('images')
          .child('profile-picture')
          .child(filename)
          .getDownloadURL();

      return Right(downloadURL);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, void>> addUserAnswers(
      {required String uid, required UserAnswersModel userAnswersModel}) async {
    try {
      await firebaseFireStore.collection('userAnswers').doc(uid).set(
          userAnswersModel.toMap()
            ..['updatedAt'] = FieldValue.serverTimestamp());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, void>> userLike(
      {required UserLike userLike}) async {
    try {
      await firebaseFireStore.collection("userLike").add(userLike.toMap());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<UserModel>>> getAllUser(
      {required String uid}) async {
    final List<UserModel> listAllUser = [];
    try {
      await firebaseFireStore
          .collection("user")
          .where("uid", isNotEqualTo: uid)
          .get()
          .then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          listAllUser.add(UserModel.fromDocument(doc));
        }
      });
      return Right(listAllUser);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<UserLike>>> getAllMyUserLike(
      {required String uid}) async {
    final List<UserLike> listAllMyUserLike = [];
    try {
      await firebaseFireStore
          .collection("userLike")
          .where("like", isEqualTo: uid)
          .get()
          .then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          listAllMyUserLike.add(UserLike.fromDocument(doc));
        }
      });
      return Right(listAllMyUserLike);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, bool>> checkMatch(
      {required String like, required String liked}) async {
    bool match = false;
    try {
      await firebaseFireStore
          .collection("userLike")
          .where("like", isEqualTo: liked)
          .where("liked", isEqualTo: like)
          .get()
          .then((QuerySnapshot snapshot) {
        if (snapshot.size > 0) {
          match = true;
        }
      });
      return Right(match);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }
}

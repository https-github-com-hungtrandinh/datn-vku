import 'dart:io';
import 'package:clean_architecture/core/util/firebase_exception.dart';
import 'package:clean_architecture/data/models/firebase/chat.dart';
import 'package:clean_architecture/data/models/firebase/interest.dart';
import 'package:clean_architecture/data/models/firebase/lifestyle.dart';
import 'package:clean_architecture/data/models/firebase/match.dart';
import 'package:clean_architecture/data/models/firebase/messages.dart';
import 'package:clean_architecture/data/models/firebase/personality.dart';
import 'package:clean_architecture/data/models/firebase/like.dart';
import 'package:clean_architecture/data/models/firebase/user_question.dart';
import 'package:clean_architecture/generated/intl/messages_en.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../models/firebase/major.dart';
import '../../../models/firebase/user.dart';
import '../remote_firebase_cloud.dart';

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
      if (await firebaseFireStore
          .collection("userLike")
          .doc(userLike.uidLike)
          .get()
          .then((value) => value.exists)) {
        try {
          await firebaseFireStore
              .collection("userLike")
              .doc(userLike.uidLike)
              .update({
            'uidLiked': FieldValue.arrayUnion([userLike.uidLiked[0]])
          });
          return const Right(null);
        } on FirebaseException catch (e) {
          return Left(FirebaseExceptionCustom(e.code));
        }
      } else {
        try {
          await firebaseFireStore
              .collection("userLike")
              .doc(userLike.uidLike)
              .set(userLike.toMap());
          return const Right(null);
        } on FirebaseException catch (e) {
          return Left(FirebaseExceptionCustom(e.code));
        }
      }
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
  Future<Either<FirebaseExceptionCustom, UserLike>> getAllMyUserLike(
      {required String uid}) async {
    try {
      UserLike userLike = await firebaseFireStore
          .collection("userLike")
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          {
            return UserLike.fromDocument(documentSnapshot);
          }
        }
        return UserLike(uidLike: '', uidLiked: []);
      });

      return Right(userLike);
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
          .where("uidLike", isEqualTo: liked)
          .where("uidLiked", arrayContainsAny: [like])
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

  @override
  Future<Either<FirebaseExceptionCustom, void>> matching(
      {required String uidLike,
      required String uidLiked,
      required String chatId}) async {
    try {
      await firebaseFireStore
          .collection("match")
          .doc(uidLike)
          .collection("listUserMatch")
          .doc(uidLiked)
          .set(MatchUser(
                  chatId: chatId,
                  uidLiked: uidLiked,
                  uidLike: uidLike,
                  createAt: DateTime.now())
              .toMap());
      await firebaseFireStore
          .collection("match")
          .doc(uidLiked)
          .collection("listUserMatch")
          .doc(uidLike)
          .set(MatchUser(
                  chatId: chatId,
                  uidLiked: uidLike,
                  uidLike: uidLiked,
                  createAt: DateTime.now())
              .toMap());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, String>> createGroupChat(
      {required String uidLike, required String uidLiked}) async {
    try {
      String chatId = await firebaseFireStore.collection('chats').add({
        'userIds': [uidLike, uidLiked],
        'lastMessage':""
      }).then((value) => value.id);
      return Right(chatId);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<MatchUser>>> getAllMatchId(
      {required String uid}) async {
    final List<MatchUser> listUserMatch = [];
    try {
      await firebaseFireStore
          .collection("match")
          .doc(uid)
          .collection("listUserMatch")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          listUserMatch.add(MatchUser.fromDocument(doc));
        }
      });
      return Right(listUserMatch);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Stream<List<Chat>> getAllChat({required String uid}) {
    return firebaseFireStore
        .collection("chats")
        .where("userIds", arrayContainsAny: [uid])
        .snapshots()
        .map((snap) {
          return snap.docs
              .map((e) => Chat.fromJson(e.data(), chatId: e.id))
              .toList();
        });
  }

  @override
  Future<Either<FirebaseExceptionCustom, List<UserModel>>> getAllUserMatch(
      {required List<MatchUser> listMatch}) async {
    try {
      final List<UserModel> listUser = [];
      for (var match in listMatch) {
        await firebaseFireStore
            .collection("user")
            .doc(match.uidLiked)
            .get()
            .then((value) {
          listUser.add(UserModel.fromDocument(value));
        });
      }
      return Right(listUser);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Stream<List<Message>> getAllMessage({required String groupChatId}) {
    return firebaseFireStore
        .collection("chats")
        .doc(groupChatId)
        .collection("message")
        .orderBy("dateTime", descending: true)
        .snapshots()
        .map((snap) {
      return snap.docs.map((e) => Message.fromJson(e.data())).toList();
    });
  }

  @override
  Future<Either<FirebaseExceptionCustom, UserModel>> getUser(
      {required String uid}) async {
    try {
      final result = await firebaseFireStore
          .collection("user")
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        return UserModel.fromDocument(documentSnapshot);
      });
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  @override
  Future<Either<FirebaseExceptionCustom, void>> seenMessage(
      {required Message message, required String groupChatId,required Chat chat}) async {
    try {
      final result = firebaseFireStore
          .collection("chats")
          .doc(groupChatId)
          .collection("message")
          .doc(DateTime.now().millisecondsSinceEpoch.toString());
      firebaseFireStore.runTransaction((transaction) async {
        transaction.set(result, message.toJson());
      }).then((value) {
        updateNewMessage(
            groupChatId: groupChatId, lastMessage: message.message,chat: chat);
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseExceptionCustom(e.code));
    }
  }

  Future<void> updateNewMessage(
      {required String groupChatId,
      required Chat chat,
      required String lastMessage}) async {
    try {
      await firebaseFireStore
          .collection("chats")
          .doc(groupChatId)
          .update({"lastMessage": lastMessage, "userIds": chat.userIds});
    } catch (e) {
      throw Exception();
    }
  }
}

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
import 'package:clean_architecture/data/models/firebase/view.dart';
import 'package:dartz/dartz.dart';
import '../../models/firebase/chat_user.dart';
import '../../models/firebase/location.dart';
import '../../models/firebase/major.dart';
import '../../models/firebase/user.dart';
import '../../models/list_id_recommender.dart';

abstract class RemoteFireBaseCloud {
  Future<void> createUser({required UserModel user});

  Future<Either<FirebaseExceptionCustom, UserModel>> getUser(
      {required String uid});

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

  Future<Either<FirebaseExceptionCustom, List<UserModel>>> getUserLike(
      {required String uid});

  Future<Either<FirebaseExceptionCustom, UserLike>> getAllMyUserLike(
      {required String uid});

  Future<Either<FirebaseExceptionCustom, bool>> checkMatch(
      {required String like, required String liked});

  Future<Either<FirebaseExceptionCustom, void>> matching(
      {required String uidLike,
      required String uidLiked,
      required String chatId});

  Future<Either<FirebaseExceptionCustom, String>> createGroupChat(
      {required String uidLike, required String uidLiked});

  Future<Either<FirebaseExceptionCustom, List<MatchUser>>> getAllMatchId(
      {required String uid});

  Future<Either<FirebaseExceptionCustom, List<ChatUser>>> getAllUserMatch(
      {required List<MatchUser> listMatch});

  Stream<List<Chat>> getAllChat({required String uid});

  Stream<List<Message>> getAllMessage({required String groupChatId});

  Future<Either<FirebaseExceptionCustom, void>> seenMessage(
      {required Message message, required String groupChatId});

  Future<Either<FirebaseExceptionCustom, String>> seenImage(
      {required String uid, required File imageFile});

  Future<Either<FirebaseExceptionCustom, void>> updateLocation(
      {required Location location, required String uid});

  Future<Either<FirebaseExceptionCustom,UserLike>> getIdUserLike({required String docId}) ;

  Stream<List<UserModel>> getAllUser({required UserLike userLike});

  Future<Either<FirebaseExceptionCustom, void>> updateUserStatus(
      {required String uid, required String status});
  Future<Either<FirebaseExceptionCustom, void>> userView(
      {required UserView userView});
  Future<Either<FirebaseExceptionCustom,List<UserModel>>> getUserRecommender({required ListIdRecommender listIdRecommender});
  Future<Either<FirebaseExceptionCustom,void>> updateUser({required String url, required String uid});
}

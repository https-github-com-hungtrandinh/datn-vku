import 'dart:io';
import 'package:clean_architecture/data/datasources/dataremote/remote_firebase_cloud.dart';
import 'package:clean_architecture/data/models/firebase/chat.dart';
import 'package:clean_architecture/data/models/firebase/major.dart';
import 'package:clean_architecture/data/models/firebase/match.dart';
import 'package:dartz/dartz.dart';
import '../../core/util/firebase_exception.dart';
import '../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../data/datasources/dataremote/remote_firebase_auth.dart';
import '../../data/models/firebase/chat_user.dart';
import '../../data/models/firebase/interest.dart';
import '../../data/models/firebase/lifestyle.dart';
import '../../data/models/firebase/location.dart';
import '../../data/models/firebase/messages.dart';
import '../../data/models/firebase/personality.dart';
import '../../data/models/firebase/user.dart';
import '../../data/models/firebase/like.dart';
import '../../data/models/firebase/user_question.dart';
import '../../data/models/firebase/view.dart';

class SocialUseCase {
  final RemoteFireBaseCloud remoteFireBaseCloud;
  final SharedPreference sharedPreference;
  final RemoteFirebaseAuth remoteDataSource;

  SocialUseCase(
      this.sharedPreference, this.remoteDataSource, this.remoteFireBaseCloud);

  Future<Either<FirebaseExceptionCustom, String>> registerWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.registerWithEmailPassword(
        email: email, password: password);
  }

  Future<Either<FirebaseExceptionCustom, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.loginWithEmailPassword(
        email: email, password: password);
  }

  Future<bool> checkAuth() async {
    return await remoteDataSource.checkAuth();
  }

  Future<Either<FirebaseExceptionCustom, List<Major>>> getMajor() async {
    return await remoteFireBaseCloud.getMajor();
  }

  Future<void> loginWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }

  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>>
      getPersonality() async {
    return await remoteFireBaseCloud.getPersonalityQuestion();
  }

  Future<Either<FirebaseExceptionCustom, List<LifestyleQuestionModel>>>
      getLifestyle() async {
    return await remoteFireBaseCloud.getLifeStyleQuestion();
  }

  Future<Either<FirebaseExceptionCustom, List<InterestModel>>>
      getInterest() async {
    return await remoteFireBaseCloud.getInterest();
  }

  Future<Either<FirebaseExceptionCustom, void>> updateUserSelection(
      {required uid,
      required String name,
      required DateTime birthday,
      required String major,
      required String gender,
      required List<String> interests,
      required String? photoUrl}) async {
    return await remoteFireBaseCloud.updateUserSelection(
        uid: uid,
        name: name,
        birthday: birthday,
        major: major,
        gender: gender,
        interests: interests,
        photoUrl: photoUrl);
  }

  Future<Either<FirebaseExceptionCustom, String>> addImageProfile(
      {required String uid, required File imageFile}) async {
    return await remoteFireBaseCloud.addImageProfile(
        uid: uid, imageFile: imageFile);
  }

  Future<Either<FirebaseExceptionCustom, void>> addUserAnswers(
      {required String uid, required UserAnswersModel userAnswersModel}) async {
    return await remoteFireBaseCloud.addUserAnswers(
        uid: uid, userAnswersModel: userAnswersModel);
  }

  Future<Either<FirebaseExceptionCustom, void>> userLike(
      {required UserLike userLike}) async {
    return await remoteFireBaseCloud.userLike(userLike: userLike);
  }

  Future<Either<FirebaseExceptionCustom, UserLike>> getAllMyUserLike(
      {required String uid}) async {
    return await remoteFireBaseCloud.getAllMyUserLike(uid: uid);
  }

  Future<Either<FirebaseExceptionCustom, List<UserModel>>> getAllUser(
      {required String uid}) async {
    return await remoteFireBaseCloud.getUserLike(uid: uid);
  }

  Future<Either<FirebaseExceptionCustom, bool>> checkMatch(
      {required String like, required String liked}) async {
    return await remoteFireBaseCloud.checkMatch(like: like, liked: liked);
  }

  Future<Either<FirebaseExceptionCustom, void>> matching(
      {required String uidLike,
      required String uidLiked,
      required String chatId}) async {
    return await remoteFireBaseCloud.matching(
        uidLike: uidLike, uidLiked: uidLiked, chatId: chatId);
  }

  Future<Either<FirebaseExceptionCustom, String>> createGroupChat(
      {required String uidLike, required String uidLiked}) async {
    return remoteFireBaseCloud.createGroupChat(
        uidLike: uidLike, uidLiked: uidLiked);
  }

  Future<Either<FirebaseExceptionCustom, List<MatchUser>>> getAllMatchId(
      {required String uid}) async {
    return await remoteFireBaseCloud.getAllMatchId(uid: uid);
  }

  Stream<List<Chat>> getAllChat({required String uid}) {
    return remoteFireBaseCloud.getAllChat(uid: uid);
  }

  Future<Either<FirebaseExceptionCustom, List<ChatUser>>> getAllUserMatch(
      {required List<MatchUser> listMatch}) async {
    return await remoteFireBaseCloud.getAllUserMatch(listMatch: listMatch);
  }

  Stream<List<Message>> getAllMessage({required String groupChatId}) {
    return remoteFireBaseCloud.getAllMessage(groupChatId: groupChatId);
  }

  Future<Either<FirebaseExceptionCustom, UserModel>> getUser(
      {required String uid}) async {
    return await remoteFireBaseCloud.getUser(uid: uid);
  }
  Future<Either<FirebaseExceptionCustom, void>> seenMessage(
      {required Message message, required String groupChatId}) async{
    return await remoteFireBaseCloud.seenMessage(message: message, groupChatId: groupChatId);
  }
  Future<Either<FirebaseExceptionCustom, String>> seenImage({required String uid, required File imageFile}) async {
    return await remoteFireBaseCloud.seenImage(uid: uid, imageFile: imageFile);
  }
  Future<Either<FirebaseExceptionCustom, void>> updateLocation(
      {required Location location, required String uid}) async{
    return await remoteFireBaseCloud.updateLocation(location: location, uid: uid);
  }
  Future<Either<FirebaseExceptionCustom,UserLike>> getIdUserLike({required String docId})async{
    return await remoteFireBaseCloud.getIdUserLike(docId: docId);
  }
  Stream<List<UserModel>> getAllUserLike({required UserLike userLike}){
    return remoteFireBaseCloud.getAllUser(userLike: userLike);
  }
  Future<Either<FirebaseExceptionCustom, void>> updateUserStatus(
      {required String uid, required String status})async{
    return remoteFireBaseCloud.updateUserStatus(uid: uid, status: status);
  }
  Future<Either<FirebaseExceptionCustom, void>> userView({required UserView userView}) async {
    return remoteFireBaseCloud.userView(userView: userView);
  }
}

import 'package:clean_architecture/data/datasources/dataremote/remote_firebase_cloud.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/firebase/major.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/util/firebase_exception.dart';
import '../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../data/datasources/dataremote/remote_firebase_auth.dart';
import '../../data/models/firebase/lifestyle.dart';
import '../../data/models/firebase/personality.dart';
import '../repositories/weather_repository.dart';

class SocialUseCase {
  final RemoteFireBaseCloud remoteFireBaseCloud;
  final WeatherRepository _weatherRepository;
  final SharedPreference sharedPreference;
  final RemoteFirebaseAuth remoteDataSource;

  SocialUseCase(this._weatherRepository, this.sharedPreference,
      this.remoteDataSource, this.remoteFireBaseCloud);

  Future<Either<Failure, Account>> login(
      {required String email, required String password}) async {
    return _weatherRepository.login(email = email, password = password);
  }

  Future<Either<Failure, Account>> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber}) async {
    return _weatherRepository.register(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        userName: userName);
  }

  Future<Either<Failure, PostAll>> getPostAll() async {
    final String token =
        await sharedPreference.get(SharedPreference.tokensAccess);
    return _weatherRepository.getPostAll(token: token);
  }

  Future<Either<FirebaseExceptionCustom, String>> registerWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.registerWithEmailPassword(
        email: email, password: password);
  }

  Future<Either<FirebaseExceptionCustom, void>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.loginWithEmailPassword(
        email: email, password: password);
  }

  Future<bool> checkAuth() async {
    return await remoteDataSource.checkAuth();
  }

  Future<Either<FirebaseExceptionCustom , List<Major>>> getMajor() async{
    return await remoteFireBaseCloud.getMajor();
  }
  Future<void> loginWithGoogle() async{
    return await remoteDataSource.signInWithGoogle();
  }
  Future<Either<FirebaseExceptionCustom, List<PersonalityQuestion>>> getPersonality() async{
    return await remoteFireBaseCloud.getPersonalityQuestion();
  }

  Future<Either<FirebaseExceptionCustom,List<LifestyleQuestionModel>>> getLifestyle() async{
    return await remoteFireBaseCloud.getLifeStyleQuestion();
  }
}

import 'package:clean_architecture/data/datasources/dataremote/remote_firebase_cloud.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/util/auth_excreption.dart';
import '../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../data/datasources/dataremote/remote_data_source.dart';
import '../repositories/weather_repository.dart';

class SocialUseCase {
  final RemoteFireBaseCloud remoteFireBaseCloud;
  final WeatherRepository _weatherRepository;
  final SharedPreference sharedPreference;
  final RemoteDataSource remoteDataSource;

  SocialUseCase(
      this._weatherRepository, this.sharedPreference, this.remoteDataSource,this.remoteFireBaseCloud);

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

  Future<Either<SignUpWithEmailAndPasswordFailure,String>> registerWithEmailPassword(
      {required String email,
      required String password,}) async {
    return remoteDataSource.registerWithEmailPassword(
        email: email, password: password);
  }

  Future<bool> checkAuth() async{
    return await remoteDataSource.checkAuth();
  }
}

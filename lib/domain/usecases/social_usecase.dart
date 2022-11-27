import 'package:clean_architecture/data/models/account.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../data/datasources/datalocal/shared_preferences_data.dart';
import '../repositories/weather_repository.dart';

class SocialUseCase {
  final WeatherRepository _weatherRepository;
  final SharedPreference sharedPreference;

  SocialUseCase(this._weatherRepository, this.sharedPreference);

  Future<Either<Failure, Account>> login(
      {required String email, required String password}) async {
    return _weatherRepository.login(email = email, password = password);
  }
  Future<Either<Failure, Account>> register(
  {required String email, required String password, required String userName , required String phoneNumber}) async{
    return _weatherRepository.register(email: email, password: password, phoneNumber: phoneNumber, userName: userName);
  }
}

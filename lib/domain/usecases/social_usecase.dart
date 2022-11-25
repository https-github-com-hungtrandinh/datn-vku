import 'package:clean_architecture/data/models/user.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repositories/weather_repository.dart';

class SocialUseCase {
  final WeatherRepository _weatherRepository;

  SocialUseCase(this._weatherRepository);

  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return _weatherRepository.login(email = email, password = password);
  }
}

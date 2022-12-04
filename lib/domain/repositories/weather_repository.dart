import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import '../../core/util/auth_excreption.dart';
import '../entities/searchphoto/search_photo.dart';
import '../entities/topicphoto/TopicPhoto.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);

  Future<Either<Failure, List<Topics>>> getCurrentTopics();

  Future<Either<Failure, List<TopicPhoto>>> getCurrentTopicPhoto(
      {required String id});

  Future<Either<Failure, List<SearchPhoto>>> getSearchPhoto(String query);

  Future<Either<Failure, Account>> login(String email, String password);

  Future<Either<Failure, Account>> register(
      {required String email,
      required String password,
      required String phoneNumber,
      required String userName});

  Future<Either<Failure,PostAll>> getPostAll({required String token});

  Future<Either<SignUpWithEmailAndPasswordFailure, void>> registerWithEmailPassword({required String email, required String password});
}

import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import '../entities/searchphoto/search_photo.dart';
import '../entities/topicphoto/TopicPhoto.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);

  Future<Either<Failure, List<Topics>>> getCurrentTopics();

  Future<Either<Failure, List<TopicPhoto>>> getCurrentTopicPhoto(
      {required String id});

  Future<Either<Failure, List<SearchPhoto>>> getSearchPhoto(String query);
}

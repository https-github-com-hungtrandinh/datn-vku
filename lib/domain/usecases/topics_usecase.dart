import 'package:clean_architecture/domain/entities/searchphoto/search_photo.dart';
import 'package:clean_architecture/domain/entities/topicphoto/TopicPhoto.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/topics/Topics.dart';
import '../repositories/weather_repository.dart';

class TopicsUseCase {
  final WeatherRepository weatherRepository;

  TopicsUseCase(this.weatherRepository);

  Future<Either<Failure, List<Topics>>> getTopics() async {
    return weatherRepository.getCurrentTopics();
  }
  Future<Either<Failure, List<TopicPhoto>>> getTopicPhoto({required String id}){
    return weatherRepository.getCurrentTopicPhoto(id: id);
  }
  Future<Either<Failure, List<SearchPhoto>>> getSearchPhoto({required String query}){
    return weatherRepository.getSearchPhoto(query);
  }
}

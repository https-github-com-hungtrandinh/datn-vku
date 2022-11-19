import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:clean_architecture/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherUseCase {
  final WeatherRepository weatherRepository;
  WeatherUseCase(this.weatherRepository);
  Future<Either<Failure,Weather>> execute(String cityName) async{
    return weatherRepository.getCurrentWeather(cityName);
  }

  Future<Either<Failure,List<Topics>>> getTopics() async{
    return weatherRepository.getCurrentTopics();
  }
}
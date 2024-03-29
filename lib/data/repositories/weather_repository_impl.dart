import 'dart:io';

import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_data_source.dart';
import 'package:clean_architecture/data/models/user.dart';
import 'package:clean_architecture/domain/entities/searchphoto/search_photo.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:clean_architecture/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/topicphoto/TopicPhoto.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final results = await remoteDataSource.getCurrentWeather(cityName);
      return Right(results.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception {
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<Failure, List<Topics>>> getCurrentTopics() async {
    try {
      final result = await remoteDataSource.getTopics();
      return Right(result.map((e) => e.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception {
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<Failure, List<TopicPhoto>>> getCurrentTopicPhoto({required String id}) async{
   try{
     final result = await remoteDataSource.getTopicPhoto(id: id);
     return Right(result.map((e) => e.toEntity()).toList());
   } on SocketException{
     return const Left(ConnectionFailure(Strings.connectionFailure));
   }on Exception{
     return const Left(SeverFailure(Strings.serverFailure));
   }
  }

  @override
  Future<Either<Failure, List<SearchPhoto>>> getSearchPhoto(String query) async{
    try{
      final result = await remoteDataSource.getSearchPhoto(query: query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on SocketException{
      return const Left(ConnectionFailure(Strings.connectionFailure));
    }on Exception{
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async{
    try{
      final result = await remoteDataSource.login(email: email, password: password);
      return Right(result);
    }on SocketException{
      return const Left(ConnectionFailure(Strings.connectionFailure));
    }on Exception{
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }
}

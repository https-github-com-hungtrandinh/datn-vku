import 'dart:io';

import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/util/auth_excreption.dart';
import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/data/datasources/dataremote/remote_data_source.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:clean_architecture/domain/entities/searchphoto/search_photo.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:clean_architecture/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<Either<Failure, List<TopicPhoto>>> getCurrentTopicPhoto(
      {required String id}) async {
    try {
      final result = await remoteDataSource.getTopicPhoto(id: id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception {
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<Failure, List<SearchPhoto>>> getSearchPhoto(
      String query) async {
    try {
      final result = await remoteDataSource.getSearchPhoto(query: query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception catch (e) {
      return Left(SeverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Account>> login(String email, String password) async {
    try {
      final result =
          await remoteDataSource.login(email: email, password: password);
      return Right(result);
    } on SocketException catch (e) {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on DioError catch (statusCode) {
      return Left(formatFailure(statusCode.response?.statusCode));
    }
  }

  @override
  Future<Either<Failure, Account>> register(
      {required String email,
      required String password,
      required String phoneNumber,
      required String userName}) async {
    try {
      final result = await remoteDataSource.register(
          email: email,
          password: password,
          userName: userName,
          phoneNumber: phoneNumber);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception {
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<Failure, PostAll>> getPostAll({required String token}) async {
    try {
      final result = await remoteDataSource.getPostAll(token: token);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure(Strings.connectionFailure));
    } on Exception {
      return const Left(SeverFailure(Strings.serverFailure));
    }
  }

  @override
  Future<Either<SignUpWithEmailAndPasswordFailure, void>>
      registerWithEmailPassword(
          {required String email, required String password}) async {
    try {
      await remoteDataSource.registerWithEmailPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return left(SignUpWithEmailAndPasswordFailure(e.code));
    }
  }
}

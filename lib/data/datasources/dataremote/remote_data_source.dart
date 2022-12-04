import 'package:clean_architecture/core/constants/key.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/post_all.dart';
import 'package:clean_architecture/data/models/topic/reponse/TopicsResponse.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/util/auth_excreption.dart';
import '../../models/searchphoto/reponse/search_photo_response.dart';
import '../../models/topicphotodto/reponse/TopicPhotoResponse.dart';
import '../../models/weather_dto.dart';

abstract class RemoteDataSource {
  Future<WeatherDto> getCurrentWeather(String cityName);

  Future<List<TopicsResponse>> getTopics();

  Future<List<TopicPhotoResponse>> getTopicPhoto({required String id});

  Future<List<SearchPhotoResponse>> getSearchPhoto({required String query});

  Future<Account> login({required String email, required String password});

  Future<PostAll> getPostAll({required String token});

  Future<bool> checkAuth();

  Future<Account> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber});

  Future<Either<SignUpWithEmailAndPasswordFailure,String>> registerWithEmailPassword(
      {required String email,
      required String password,});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ConstApp.baseUrlHeroku,
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<WeatherDto> getCurrentWeather(String cityName) async {
    const String url = "${ConstApp.baseUrl}topics";
    Response response =
        await _dio.get(url, queryParameters: {"client_id": ConstApp.keyApi});
    if (response.statusCode == 200) {
      return WeatherDto.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<TopicsResponse>> getTopics() async {
    Response response = await _dio.get(ConstApp.currentUnsplashTopics);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => TopicsResponse.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<TopicPhotoResponse>> getTopicPhoto({required String id}) async {
    final String url = "${ConstApp.baseUrl}topics/$id/photos";
    Response response = await _dio.get(
      url,
      queryParameters: {"client_id": ConstApp.keyApi},
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => TopicPhotoResponse.fromJson(e))
          .toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  Future<List<SearchPhotoResponse>> getSearchPhoto(
      {required String query}) async {
    final String url =
        "${ConstApp.baseUrl}search/photos?clinet_id=${ConstApp.keyApi}&query=$query";

    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => SearchPhotoResponse.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<Account> login(
      {required String email, required String password}) async {
    final Map<String, dynamic> body = {"email": email, "password": password};
    Response response = await _dio.post(
      'v1/auth/login',
      data: body,
    );
    if (response.statusCode == 200) {
      return Account.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Account> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber}) async {
    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "name": userName,
      "gender": true,
      "phoneNumber": phoneNumber
    };
    Response response = await _dio.post("v1/auth/register", data: body);
    if (response.statusCode == 200) {
      return Account.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<PostAll> getPostAll({required String token}) async {
    Response response = await _dio.get(
      'post',
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );
    if (response.statusCode == 200) {
      return PostAll.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Either<SignUpWithEmailAndPasswordFailure,String>> registerWithEmailPassword(
      {required String email,
      required String password,
      }) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
       return   Right(result.user!.uid);

    } on FirebaseAuthException catch(e) {
      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    }
  }

  @override
  Future<bool> checkAuth() async {
     bool auth =false;
      firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        auth = false;
      } else {
        auth = true;
      }
    });
    return auth;
  }
}

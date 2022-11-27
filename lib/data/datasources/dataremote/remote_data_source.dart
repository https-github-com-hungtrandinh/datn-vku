import 'package:clean_architecture/core/constants/key.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/data/models/account.dart';
import 'package:clean_architecture/data/models/topic/reponse/TopicsResponse.dart';
import 'package:dio/dio.dart';

import '../../models/searchphoto/reponse/search_photo_response.dart';
import '../../models/topicphotodto/reponse/TopicPhotoResponse.dart';
import '../../models/weather_dto.dart';

abstract class RemoteDataSource {
  Future<WeatherDto> getCurrentWeather(String cityName);

  Future<List<TopicsResponse>> getTopics();

  Future<List<TopicPhotoResponse>> getTopicPhoto({required String id});

  Future<List<SearchPhotoResponse>> getSearchPhoto({required String query});

  Future<Account> login({required String email, required String password});

  Future<Account> register({required String email,
    required String password,
    required String userName,
    required String phoneNumber});
}

class RemoteDataSourceImpl implements RemoteDataSource {
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
        "${ConstApp.baseUrl}search/photos?clinet_id=${ConstApp
        .keyApi}&query=$query";

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
  Future<Account> register({required String email,
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

  void networkException(Response response) {
    switch (response.statusCode) {
      case 400:
        throw RequestTimeOut("hung");
        break;
      case 401:
        throw RequestTimeOut("hung1");
        break;
      case 403:
        throw RequestTimeOut("hung2");
        break;
      case 404:
        throw RequestTimeOut("hung3");
        break;
      case 409:
        throw RequestTimeOut("hung4");
        break;
      case 408:
        throw RequestTimeOut("hung5");
        break;
      case 500:
        throw RequestTimeOut("hung5");
        break;
    }
  }
}

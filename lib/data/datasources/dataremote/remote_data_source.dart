import 'package:clean_architecture/core/constants/key.dart';
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
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<WeatherDto> getCurrentWeather(String cityName) async {
    const String url = "${KeyUnsplash.baseUrl}topics";
    Response response =
        await _dio.get(url, queryParameters: {"client_id": KeyUnsplash.keyApi});
    if (response.statusCode == 200) {
      return WeatherDto.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<TopicsResponse>> getTopics() async {
    Response response = await _dio.get(KeyUnsplash.currentUnsplashTopics);
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
    final String url = "${KeyUnsplash.baseUrl}topics/$id/photos";
    Response response = await _dio.get(
      url,
      queryParameters: {"client_id": KeyUnsplash.keyApi},
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => TopicPhotoResponse.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<SearchPhotoResponse>> getSearchPhoto(
      {required String query}) async {
    final String url =
        "${KeyUnsplash.baseUrl}search/photos?clinet_id=${KeyUnsplash.keyApi}&query=$query";

    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => SearchPhotoResponse.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}

import 'package:clean_architecture/data/datasources/dataremote/remote_api_recommender.dart';
import 'package:clean_architecture/data/models/list_id_recommender.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/key.dart';

class RemoteApiRecommenderImpl extends RemoteApiRecommender {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ConstApp.baseUrl,
      headers: {'content-type': 'application/json'}));

  @override
  Future<Either<void, ListIdRecommender>> getIdRecommender(
      {required String uid}) async {
    Response response = await _dio.get("", queryParameters: {"user_id": uid});
    if (response.statusCode == 200) {
      return Right(ListIdRecommender.fromJson(response.data));
    } else {
      return const Left(null);
    }
  }

  @override
  Future<void> training() async {
    try {
      Response response = await _dio.post("training");

    } catch (e) {
      throw Exception();
    }
  }
}

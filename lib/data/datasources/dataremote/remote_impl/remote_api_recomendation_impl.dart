import 'package:clean_architecture/data/datasources/dataremote/remote_api_recomendation.dart';
import 'package:clean_architecture/data/models/uid_user_recommendation.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/key.dart';

class RemoteApiRecommendationImpl extends RemoteApiRecommendation {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ConstApp.baseUrlRecommendation,
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<Either<void, void>> updateRecommendation() async {
    try {
      Response response = await _dio.patch('training');
      return const Right(null);
    } catch (e) {
      return const Left(null);
    }
  }

  @override
  Future<Either<void, UidUserRecommendation>> getListRecommendation(
      {required String uid}) async {
    try {
      Response response = await _dio.get("", queryParameters: {"user_id": uid});
      return Right(UidUserRecommendation.fromJson(response.data));
    } catch (e) {
      return const Left(null);
    }
  }
}

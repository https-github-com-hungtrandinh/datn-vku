import 'package:clean_architecture/data/models/uid_user_recommendation.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteApiRecommendation{
  Future<Either<void, void>> updateRecommendation();

  Future<Either<void, UidUserRecommendation>> getListRecommendation({required String uid});
}
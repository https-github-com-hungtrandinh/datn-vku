import 'package:dartz/dartz.dart';

import '../../models/list_id_recommender.dart';

abstract class RemoteApiRecommender{
    Future<void> training();
    Future<Either<void,ListIdRecommender>> getIdRecommender({required String uid});
}
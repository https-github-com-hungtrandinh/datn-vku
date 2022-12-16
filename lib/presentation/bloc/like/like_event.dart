import 'package:equatable/equatable.dart';

import '../../../data/models/firebase/like.dart';

abstract class LikeEvent extends Equatable{

}
class GetAllIdUserEvent extends LikeEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
class GetAllUserEvent extends  LikeEvent{


  GetAllUserEvent();
  @override
  List<Object?> get props => [];
}
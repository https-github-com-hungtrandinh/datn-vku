
import 'package:equatable/equatable.dart';



abstract class HomeEvent extends Equatable {

}
class UserWatchEvent extends HomeEvent{
  final String userWatch;

  UserWatchEvent(this.userWatch);
  @override
  List<Object?> get props => [userWatch];

}
class UserLikeEvent extends HomeEvent{
  final String liked;

  UserLikeEvent(this.liked);
  @override
  List<Object?> get props =>[liked];

}
class GetAllUser extends HomeEvent{
  @override
  List<Object?> get props => [];

}
class UpdateCheckMatch extends HomeEvent{

  @override
  List<Object?> get props => [];

}
class UpdateLocation extends HomeEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class GetMyUser extends HomeEvent{
  @override
  List<Object?> get props => [];

}


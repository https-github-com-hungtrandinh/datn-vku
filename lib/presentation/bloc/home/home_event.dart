import 'package:clean_architecture/presentation/pages/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


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

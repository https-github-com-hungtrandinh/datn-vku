import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable{

}

class GetUserProfile extends ProfileEvent{
  @override
  List<Object?> get props =>[];
}
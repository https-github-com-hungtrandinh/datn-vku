import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable{

}
class GetAllMatch extends ChatEvent{
  @override
  List<Object?> get props => [];

}
class GetAllMessages extends ChatEvent{
  @override
  List<Object?> get props => [];

}
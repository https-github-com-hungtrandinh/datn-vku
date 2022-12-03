import 'package:equatable/equatable.dart';



abstract class PostEvent extends Equatable{

}
class GetPostAll extends PostEvent{
  @override
  List<Object?> get props =>[] ;
}
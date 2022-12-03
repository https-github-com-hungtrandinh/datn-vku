import 'package:clean_architecture/data/models/post_all.dart';
import 'package:equatable/equatable.dart';

enum LoadAllPostStatus{
  initial,
  loading,
  loaded,
  error,
}
class PostState extends Equatable{
  final LoadAllPostStatus loadAllPostStatus;
  final PostAll? postAll;

  const PostState({required this.loadAllPostStatus,required this.postAll});

  factory PostState.initial(){
    return const PostState(loadAllPostStatus: LoadAllPostStatus.initial,postAll: null);
  }
  PostState copyWith({LoadAllPostStatus? loadAllPostStatus ,PostAll? postAll}){
    return PostState(loadAllPostStatus: loadAllPostStatus ?? this.loadAllPostStatus, postAll: postAll ?? this.postAll);

  }
  @override
  List<Object?> get props =>[loadAllPostStatus,postAll];

}
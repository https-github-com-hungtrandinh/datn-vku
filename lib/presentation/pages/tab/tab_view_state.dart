import 'package:clean_architecture/domain/entities/topicphoto/TopicPhoto.dart';
import 'package:equatable/equatable.dart';

enum TabViewStatus { loading, error, success, initial }

class TabViewState extends Equatable {
  final TabViewStatus tabViewStatus;
  final List<TopicPhoto> topicPhoto;

  const TabViewState({required this.tabViewStatus, required this.topicPhoto});

  factory TabViewState.initial() {
    return const TabViewState(
        tabViewStatus: TabViewStatus.initial, topicPhoto: []);
  }

  TabViewState copyWith(
      {TabViewStatus? tabViewStatus, List<TopicPhoto>? topicPhoto}) {
    return TabViewState(
        tabViewStatus: tabViewStatus ?? this.tabViewStatus,
        topicPhoto: topicPhoto ?? this.topicPhoto);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [topicPhoto, tabViewStatus];
}

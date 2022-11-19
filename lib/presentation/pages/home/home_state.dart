import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:clean_architecture/domain/entities/weather.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/topicphoto/TopicPhoto.dart';

enum HomeStatus { initial, loading, error, success }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  final Weather? weather;
  final List<Topics>? topics;
  final List<TopicPhoto>? topicPhoto;

  const HomeState(
      {required this.homeStatus,
      required this.weather,
      required this.topics,
      required this.topicPhoto});

  factory HomeState.initial() {
    return const HomeState(
        homeStatus: HomeStatus.initial,
        weather: null,
        topics: null,
        topicPhoto: null);
  }

  HomeState copyWith(
      {HomeStatus? homeStatus,
      Weather? weather,
      List<Topics>? topics,
      List<TopicPhoto>? topicPhoto}) {
    return HomeState(
        topicPhoto: topicPhoto ?? this.topicPhoto,
        topics: topics ?? this.topics,
        homeStatus: homeStatus ?? this.homeStatus,
        weather: weather ?? this.weather);
  }

  @override
  List<Object?> get props => [homeStatus, weather, topics,topicPhoto];
}

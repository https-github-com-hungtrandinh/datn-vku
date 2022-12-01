import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, loaded, success }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  const HomeState({required this.homeStatus});

  factory HomeState.initial() {
    return const HomeState(homeStatus: HomeStatus.initial);
  }
  HomeState copyWith({HomeStatus? homeStatus}){
    return HomeState(homeStatus: homeStatus ?? this.homeStatus);
  }

  @override
  List<Object?> get props => [homeStatus];
}

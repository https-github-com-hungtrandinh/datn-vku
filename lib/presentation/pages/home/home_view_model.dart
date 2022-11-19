import 'package:clean_architecture/domain/usecases/weather_usecase.dart';
import 'package:clean_architecture/presentation/pages/home/home_state.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/topics_usecase.dart';

class HomeVM extends ChangeNotifier {
  HomeState _homeState = HomeState.initial();

  HomeState get homeState => _homeState;
  final WeatherUseCase weatherUseCase;
  final TopicsUseCase topicsUseCase;

  HomeVM(this.weatherUseCase, this.topicsUseCase){
    getTopics();
  }
  Future<void> getCurrentWeather(String cityName) async {
    _homeState = _homeState.copyWith(homeStatus: HomeStatus.loading);
    notifyListeners();
    final result = await weatherUseCase.execute(cityName);
    result.fold((failure) {
      _homeState = _homeState.copyWith(homeStatus: HomeStatus.error);
      notifyListeners();
    }, (data) {
      _homeState =
          _homeState.copyWith(homeStatus: HomeStatus.success, weather: data);
      notifyListeners();
    });
  }

  Future<void> getTopics() async {
    _homeState = _homeState.copyWith(homeStatus: HomeStatus.loading);
    notifyListeners();
    final result =await topicsUseCase.getTopics();
    result.fold((failure){
      _homeState = _homeState.copyWith(homeStatus: HomeStatus.error);
      notifyListeners();
    }, (data){
      _homeState =
          _homeState.copyWith(homeStatus: HomeStatus.success, topics: data);
      notifyListeners();
    });
  }

}

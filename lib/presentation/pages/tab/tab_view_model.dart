import 'package:clean_architecture/presentation/pages/tab/tab_view_state.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecases/topics_usecase.dart';

class TabVM extends ChangeNotifier{
  final TopicsUseCase topicsUseCase;
  TabViewState _tabViewState =TabViewState.initial();
  TabViewState get tabViewState =>_tabViewState;
  TabVM(this.topicsUseCase);
  Future<void> getTopicPhoto({required String id}) async{
    _tabViewState = _tabViewState.copyWith(tabViewStatus: TabViewStatus.loading);
    notifyListeners();
    final result =await topicsUseCase.getTopicPhoto(id: id);
    result.fold((failure){
      _tabViewState = _tabViewState.copyWith(tabViewStatus: TabViewStatus.error);
      notifyListeners();
    }, (data){
      _tabViewState =
          _tabViewState.copyWith(tabViewStatus: TabViewStatus.success , topicPhoto: data);
      notifyListeners();
    });
    notifyListeners();
  }

}
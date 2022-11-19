import 'package:clean_architecture/domain/usecases/topics_usecase.dart';
import 'package:clean_architecture/presentation/pages/search/search_state.dart';
import 'package:flutter/cupertino.dart';

class SearchVM extends ChangeNotifier {
  final TopicsUseCase topicsUseCase;
  SearchState _searchState = SearchState.initial();

  SearchState get searchState => _searchState;

  SearchVM(this.topicsUseCase);

  Future<void> getCategory() async {
    _searchState = _searchState.copyWith(
        loadingCategoryStatus: LoadingCategoryStatus.loading);
    final result = await topicsUseCase.getTopics();
    result.fold((error) {
      _searchState = _searchState.copyWith(
          loadingCategoryStatus: LoadingCategoryStatus.error);
    },
        (data) => _searchState = _searchState.copyWith(
            loadingCategoryStatus: LoadingCategoryStatus.success,
            topics: data));
  }
  void forcus(bool focus){
    _searchState =_searchState.copyWith(focus: focus);
    notifyListeners();
  }
}

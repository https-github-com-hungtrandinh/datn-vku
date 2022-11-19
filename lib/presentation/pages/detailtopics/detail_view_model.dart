import 'package:clean_architecture/presentation/pages/detailtopics/detail_state.dart';
import 'package:flutter/material.dart';

class DetailVM extends ChangeNotifier {
  DetailState _detailState = DetailState.initial();

  DetailState get detailState => _detailState;

  onClick() {
    _detailState = _detailState.copyWith(onClick: !_detailState.onClick);
    notifyListeners();
  }

  showDownload() {
    _detailState =
        _detailState.copyWith(showDownload: !_detailState.showDownload);
    notifyListeners();
  }
}

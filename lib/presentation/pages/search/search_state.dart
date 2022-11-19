import 'package:clean_architecture/domain/entities/searchphoto/search_photo.dart';
import 'package:clean_architecture/domain/entities/topics/Topics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/topicphoto/TopicPhoto.dart';

enum LoadingCategoryStatus { loading, success, error, initial }

class SearchState extends Equatable {
  final LoadingCategoryStatus loadingCategoryStatus;
  final List<SearchPhoto> searchPhoto;
  final List<Topics> topics;
  final bool focus;

  SearchState(
      {required this.searchPhoto,
      required this.loadingCategoryStatus,
      required this.topics,
      required this.focus});

  factory SearchState.initial() {
    return SearchState(
        focus: false,
        searchPhoto: [],
        loadingCategoryStatus: LoadingCategoryStatus.initial,
        topics: []);
  }

  SearchState copyWith(
      {bool? focus,
      List<SearchPhoto>? searchPhoto,
      List<Topics>? topics,
      LoadingCategoryStatus? loadingCategoryStatus}) {
    return SearchState(
        focus: focus ?? this.focus,
        searchPhoto: searchPhoto ?? this.searchPhoto,
        loadingCategoryStatus:
            loadingCategoryStatus ?? this.loadingCategoryStatus,
        topics: topics ?? this.topics);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [loadingCategoryStatus, topics, searchPhoto, focus];
}

import 'package:clean_architecture/data/models/pagination.dart';
import 'package:clean_architecture/data/models/post.dart';

class PostAll {
  final List<Posts> posts;
  final Pagination pagination;

  PostAll({required this.posts, required this.pagination});

  factory PostAll.fromJson(Map<String, dynamic> json) {
    return PostAll(
        posts: (json['posts'] as List).map((e) => Posts.fromJson(e)).toList(),
        pagination: Pagination.fromJson(json['pagination']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['posts'] = posts.map((post) => post.toJson()).toList();

    data['pagination'] = pagination.toJson();

    return data;
  }
}

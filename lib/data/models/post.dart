import 'likes.dart';

class Posts {
  final List<String> media;
  final List<Likes>? likes;
  final List<String> comments;
  final String sId;
  final Likes userId;
  final String content;
  final String createdAt;
  final String updatedAt;
  final int? iV;
  final String type;

  Posts({required this.media,
    required this.likes,
    required this.comments,
    required this.sId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
    required this.type});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        media:
        (json['media'] as List).map((media) => media.toString()).toList(),
        likes: (json['likes'] as List)
            .map((likes) => Likes.fromJson(likes))
            .toList(),
        comments: (json['comments'] as List)
            .map((comments) => comments.toString())
            .toList(),
        sId: json['_id'],
        userId: json['userId'],
        content: json['content'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        iV: json['__v'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media'] = media;
    data['likes'] = likes!.map((likes) => likes.toJson()).toList();
    data['comments'] = comments.map((comments) => comments.toString());
    data['_id'] = sId;
    data['content'] = content;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    data['type'] = type;
    return data;
  }
}




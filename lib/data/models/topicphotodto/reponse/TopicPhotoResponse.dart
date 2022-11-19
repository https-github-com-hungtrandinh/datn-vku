import 'package:clean_architecture/domain/entities/topicphoto/TopicPhoto.dart';

import '../TopicPhotoLinksDto.dart';
import '../TopicPhotoUrlsDto.dart';
import '../TopicPhotoUserDto.dart';

class TopicPhotoResponse {
  final String id;
  final String? createAt;
  final String? updateAt;
  final String? promotedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String? altDescription;
  final String? description;
  final TopicPhotoUrlsDto topicPhotoUrlsDto;
  final TopicPhotoUserDto topicPhotoUserDto;
  final TopicPhotoLinksDto topicPhotoLinksDto;
  final int likes;
  final bool? likeByUser;

  const TopicPhotoResponse({
    required this.topicPhotoUrlsDto,
    required this.topicPhotoUserDto,
    required this.topicPhotoLinksDto,
    required this.updateAt,
    required this.likes,
    required this.height,
    required this.description,
    required this.id,
    required this.width,
    required this.color,
    required this.altDescription,
    required this.blurHash,
    required this.createAt,
    required this.likeByUser,
    required this.promotedAt,
  });

  factory TopicPhotoResponse.fromJson(Map<String, dynamic> json) {
    return TopicPhotoResponse(
        topicPhotoUrlsDto: TopicPhotoUrlsDto.fromJson(json["urls"]),
        topicPhotoUserDto: TopicPhotoUserDto.fromJson(json["user"]),
        topicPhotoLinksDto: TopicPhotoLinksDto.fromJson(json["links"]),
        updateAt: json["update_at"],
        likes: json["likes"],
        height: json["height"],
        description: json["description"],
        id: json["id"],
        width: json["width"],
        color: json["color"],
        altDescription: json["alt_description"],
        blurHash: json["blur_hash"],
        createAt: json["create_at"],
        likeByUser: json["like_by_user"],
        promotedAt: json["promoted_at"]);
  }

  TopicPhoto toEntity() => TopicPhoto(
      topicPhotoUrls: topicPhotoUrlsDto.toEntity(),
      topicPhotoUser: topicPhotoUserDto.toEntity(),
      topicPhotoLinks: topicPhotoLinksDto.toEntity(),
      updateAt: updateAt,
      likes: likes,
      height: height,
      description: description,
      id: id,
      width: width,
      color: color,
      altDescription: altDescription,
      blurHash: blurHash,
      createAt: createAt,
      likeByUser: likeByUser,
      promotedAt: promotedAt);
}

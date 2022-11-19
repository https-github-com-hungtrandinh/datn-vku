import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUserLinks.dart';

class TopicPhotoUserLinksDto {
  final String self;
  final String html;
  final String photos;
  final String? likes;
  final String following;
  final String followers;

  TopicPhotoUserLinksDto(
      {required this.self,
      required this.html,
      required this.photos,
      required this.likes,
      required this.following,
      required this.followers});

  factory TopicPhotoUserLinksDto.fromJson(Map<String, dynamic> json) {
    return TopicPhotoUserLinksDto(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        following: json["following"],
        followers: json["followers"]);
  }

  TopicPhotoUserLinks toEntity() => TopicPhotoUserLinks(
      html: html,
      self: self,
      followers: followers,
      following: following,
      likes: likes,
      photos: photos);
}

import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoLinks.dart';
import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUrls.dart';
import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUser.dart';

class TopicPhoto {
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
  final TopicPhotoUrls topicPhotoUrls;
  final TopicPhotoUser topicPhotoUser;
  final TopicPhotoLinks topicPhotoLinks;
  final int likes;
  final bool? likeByUser;

  const TopicPhoto({
    required this.topicPhotoUrls,
    required this.topicPhotoUser,
    required this.topicPhotoLinks,
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
}

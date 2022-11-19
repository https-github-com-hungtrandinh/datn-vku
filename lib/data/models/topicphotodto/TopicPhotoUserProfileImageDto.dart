import '../../../domain/entities/topicphoto/TopicPhotoUserProfileImage.dart';

class TopicPhotoUserProfileImageDto {
  final String small;
  final String medium;
  final String large;

  const TopicPhotoUserProfileImageDto(
      {required this.small, required this.large, required this.medium});

  factory TopicPhotoUserProfileImageDto.fromJson(Map<String, dynamic> json) {
    return TopicPhotoUserProfileImageDto(
        small: json["small"], large: json["large"], medium: json["medium"]);
  }

  TopicPhotoUserProfileImage toEntity() =>
      TopicPhotoUserProfileImage(small: small, large: large, medium: medium);
}

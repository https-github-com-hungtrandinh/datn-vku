import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUserLinks.dart';
import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUserProfileImage.dart';

class TopicPhotoUser {
  final String id;
  final String? updateAt;
  final String userName;
  final String name;
  final String firstName;
  final String? lastName;
  final String? bio;
  final String? location;
  final TopicPhotoUserLinks topicPhotoUserLinks;
  final TopicPhotoUserProfileImage topicPhotoUserProfileImage;
  final String? instagramUsername;
  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;
  final bool acceptedTos;
  final bool forHire;

  const TopicPhotoUser(
      {required this.id,
      required this.updateAt,
      required this.userName,
      required this.name,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.location,
      required this.topicPhotoUserProfileImage,
      required this.topicPhotoUserLinks,
      required this.acceptedTos,
      required this.forHire,
      required this.instagramUsername,
      required this.totalCollections,
      required this.totalLikes,
      required this.totalPhotos});
}

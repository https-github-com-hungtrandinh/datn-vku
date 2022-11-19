import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUser.dart';

import 'TopicPhotoUserLinksDto.dart';
import 'TopicPhotoUserProfileImageDto.dart';

class TopicPhotoUserDto {
  final String id;
  final String? updateAt;
  final String userName;
  final String name;
  final String firstName;
  final String? lastName;
  final String? bio;
  final String? location;
  final TopicPhotoUserLinksDto topicPhotoUserLinksDto;
  final TopicPhotoUserProfileImageDto topicPhotoUserProfileImageDto;
  final String? instagramUsername;
  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;
  final bool acceptedTos;
  final bool forHire;

  const TopicPhotoUserDto({required this.id,
    required this.updateAt,
    required this.userName,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.location,
    required this.topicPhotoUserProfileImageDto,
    required this.topicPhotoUserLinksDto,
    required this.acceptedTos,
    required this.forHire,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos});

  factory TopicPhotoUserDto.fromJson(Map<String, dynamic> json){
    return TopicPhotoUserDto(id: json["id"],
        updateAt: json["update_at"],
        userName: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        bio: json["bio"],
        location: json["location"],
        topicPhotoUserProfileImageDto: TopicPhotoUserProfileImageDto.fromJson(
            json["profile_image"]),
        topicPhotoUserLinksDto: TopicPhotoUserLinksDto.fromJson(json["links"]),
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"]);
  }

  TopicPhotoUser toEntity() =>
      TopicPhotoUser(id: id,
          updateAt: updateAt,
          userName: userName,
          name: name,
          firstName: firstName,
          lastName: lastName,
          bio: bio,
          location: location,
          topicPhotoUserProfileImage: topicPhotoUserProfileImageDto.toEntity(),
          topicPhotoUserLinks: topicPhotoUserLinksDto.toEntity(),
          acceptedTos: acceptedTos,
          forHire: forHire,
          instagramUsername: instagramUsername,
          totalCollections: totalCollections,
          totalLikes: totalLikes,
          totalPhotos: totalPhotos);
}

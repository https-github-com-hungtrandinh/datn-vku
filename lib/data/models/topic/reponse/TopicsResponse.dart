import 'package:clean_architecture/domain/entities/topics/Topics.dart';

import '../TopicsPreviewPhotosDto.dart';

class TopicsResponse {
  final String id;
  final String slug;
  final String description;
  final String publishedAt;
  final String? updateAt;
  final String startsAt;
  final String? endsAt;
  final String? onlySubmissionsAfter;
  final bool featured;
  final int totalPhotos;
  final String? totalCurrentUserSubmissions;
  final List<TopicsPreviewPhotosDto> topicsPreviewPhotosDto;

  const TopicsResponse({
    required this.id,
    required this.updateAt,
    required this.description,
    required this.totalPhotos,
    required this.endsAt,
    required this.featured,
    required this.onlySubmissionsAfter,
    required this.publishedAt,
    required this.slug,
    required this.startsAt,
    required this.topicsPreviewPhotosDto,
    required this.totalCurrentUserSubmissions,
  });

  factory TopicsResponse.fromJson(Map<String, dynamic> json) {
    return TopicsResponse(
        id: json['id'],
        updateAt: json["update_at"],
        description: json["description"],
        totalPhotos: json["total_photos"],
        endsAt: json["ends_at"],
        featured: json["featured"],
        onlySubmissionsAfter: json["only_submissions_after"],
        publishedAt: json["published_at"],
        slug: json["slug"],
        startsAt: json["starts_at"],
        topicsPreviewPhotosDto: (json["preview_photos"] as List)
            .map((e) => TopicsPreviewPhotosDto.fromJson(e))
            .toList(),
        totalCurrentUserSubmissions: json["total_current_user_submissions"]);
  }
  Topics toEntity() => Topics(
      id: id,
      updateAt: updateAt,
      description: description,
      totalPhotos: totalPhotos,
      endsAt: endsAt,
      featured: featured,
      onlySubmissionsAfter: onlySubmissionsAfter,
      publishedAt: publishedAt,
      slug: slug,
      startsAt: startsAt,
      topicsPreviewPhotos: topicsPreviewPhotosDto.map((e) => e.toEntity()).toList(),
      totalCurrentUserSubmissions: totalCurrentUserSubmissions);
}

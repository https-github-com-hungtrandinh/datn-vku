import 'TopicsPreviewPhotos.dart';

class Topics {
  final String id;
  final String slug;
  final String description;
  final String publishedAt;
  final String? updateAt;
  final String? startsAt;
  final String? endsAt;
  final String? onlySubmissionsAfter;
  final bool featured;
  final int totalPhotos;
  final String? totalCurrentUserSubmissions;
  final List<TopicsPreviewPhotos> topicsPreviewPhotos;

  const Topics(
      {required this.id,
        required this.updateAt,
        required this.description,
        required this.totalPhotos,
        required this.endsAt,
        required this.featured,
        required this.onlySubmissionsAfter,
        required this.publishedAt,
        required this.slug,
        required this.startsAt,
        required this.topicsPreviewPhotos,
        required this.totalCurrentUserSubmissions,
      });
}
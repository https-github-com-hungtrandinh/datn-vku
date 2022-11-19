import 'package:clean_architecture/data/models/topic/TopicsPreviewPhotoUrlsDto.dart';
import 'package:clean_architecture/domain/entities/topics/TopicsPreviewPhotos.dart';

class TopicsPreviewPhotosDto {
  final String id;
  final String? createAt;
  final String? updateAt;
  final String? blurHash;
  final TopicsPreviewPhotoUrlsDto topicsPreviewPhotoUrlsDto;

  const TopicsPreviewPhotosDto(
      {required this.id,
      required this.topicsPreviewPhotoUrlsDto,
      required this.createAt,
      required this.blurHash,
      required this.updateAt});

  factory TopicsPreviewPhotosDto.fromJson(Map<String, dynamic> json) {
    return TopicsPreviewPhotosDto(
        id: json['id'],
        topicsPreviewPhotoUrlsDto:
            TopicsPreviewPhotoUrlsDto.fromJson(json["urls"]),
        createAt: json["create_at"],
        blurHash: json["blur_hash"],
        updateAt: json["update_at"]);
  }

  TopicsPreviewPhotos toEntity() => TopicsPreviewPhotos(
      id: id,
      topicsPreviewPhotoUrls: topicsPreviewPhotoUrlsDto.toEntity(),
      createAt: createAt,
      blurHash: blurHash,
      updateAt: updateAt);
}

import 'package:clean_architecture/domain/entities/topics/TopicsPreviewPhotoUrls.dart';

class TopicsPreviewPhotoUrlsDto {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  const TopicsPreviewPhotoUrlsDto(
      {required this.smallS3,
      required this.raw,
      required this.full,
      required this.regular,
      required this.thumb,
      required this.small});

  factory TopicsPreviewPhotoUrlsDto.fromJson(Map<String, dynamic> json) {
    return TopicsPreviewPhotoUrlsDto(
        smallS3: json["small_s3"],
        raw: json["raw"],
        full: json['full'],
        regular: json['regular'],
        thumb: json['thumb'],
        small: json['small']);
  }

  TopicsPreviewPhotoUrls toEntity() => TopicsPreviewPhotoUrls(
      smallS3: smallS3,
      raw: raw,
      full: full,
      regular: regular,
      thumb: thumb,
      small: small);
}

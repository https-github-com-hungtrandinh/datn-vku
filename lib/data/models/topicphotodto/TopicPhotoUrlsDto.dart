import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoUrls.dart';

class TopicPhotoUrlsDto {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  const TopicPhotoUrlsDto(
      {required this.small,
      required this.thumb,
      required this.regular,
      required this.full,
      required this.raw,
      required this.smallS3});

  factory TopicPhotoUrlsDto.fromJson(Map<String, dynamic> json) {
    return TopicPhotoUrlsDto(
        small: json["small"],
        thumb: json["thumb"],
        regular: json["regular"],
        full: json["full"],
        raw: json["raw"],
        smallS3: json["small_s3"]);
  }

  TopicPhotoUrls toEntity() => TopicPhotoUrls(
      raw: raw,
      full: full,
      regular: regular,
      small: small,
      smallS3: smallS3,
      thumb: thumb);
}

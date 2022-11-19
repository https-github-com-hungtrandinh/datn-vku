import 'package:clean_architecture/domain/entities/searchphoto/search_photo_url.dart';
import 'package:clean_architecture/domain/entities/topics/TopicsPreviewPhotoUrls.dart';

class SearchPhotoUrlDto {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  const SearchPhotoUrlDto(
      {required this.smallS3,
        required this.raw,
        required this.full,
        required this.regular,
        required this.thumb,
        required this.small});

  factory SearchPhotoUrlDto.fromJson(Map<String, dynamic> json) {
    return SearchPhotoUrlDto(
        smallS3: json["small_s3"],
        raw: json["raw"],
        full: json['full'],
        regular: json['regular'],
        thumb: json['thumb'],
        small: json['small']);
  }

    SearchPhotoUrl toEntity() => SearchPhotoUrl(
      smallS3: smallS3,
      raw: raw,
      full: full,
      regular: regular,
      thumb: thumb,
      small: small);
}

import 'package:clean_architecture/domain/entities/searchphoto/search_photo_links.dart';

class SearchPhotoLinksDto {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  SearchPhotoLinksDto(
      {required this.download,
      required this.html,
      required this.self,
      required this.downloadLocation});

  factory SearchPhotoLinksDto.fromJson(Map<String, dynamic> json) {
    return SearchPhotoLinksDto(
        download: json["download"],
        html: json["html"],
        self: json["self"],
        downloadLocation: json["download_location"]);
  }

  SearchPhotoLinks toEntity() => SearchPhotoLinks(
      download: download,
      html: html,
      self: self,
      downloadLocation: downloadLocation);

}


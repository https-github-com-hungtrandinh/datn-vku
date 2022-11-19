import 'package:clean_architecture/domain/entities/topicphoto/TopicPhotoLinks.dart';

class TopicPhotoLinksDto {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  const TopicPhotoLinksDto(
      {required this.self,
      required this.downloadLocation,
      required this.html,
      required this.download});

  factory TopicPhotoLinksDto.fromJson(Map<String, dynamic> json) {
    return TopicPhotoLinksDto(
        self: json["self"],
        downloadLocation: json["download_location"],
        html: json["html"],
        download: json["download"]);
  }

  TopicPhotoLinks toEntity() => TopicPhotoLinks(
      self: self,
      download: download,
      downloadLocation: downloadLocation,
      html: html);
}

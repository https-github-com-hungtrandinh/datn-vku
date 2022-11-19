import 'package:clean_architecture/data/models/searchphoto/search_photo_link_dto.dart';
import 'package:clean_architecture/data/models/searchphoto/search_photo_url_dto.dart';
import 'package:clean_architecture/domain/entities/searchphoto/search_photo.dart';

class SearchPhotoResponse {
  final String id;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String description;
  final SearchPhotoUrlDto searchPhotoUrlDto;
  final SearchPhotoLinksDto searchPhotoLinksDto;
  final int likes;

  SearchPhotoResponse({required this.searchPhotoLinksDto,
    required this.id,
    required this.height,
    required this.width,
    required this.description,
    required this.blurHash,
    required this.color,
    required this.likes,
    required this.searchPhotoUrlDto});

  factory SearchPhotoResponse.fromJson(Map<String, dynamic> json) {
    return SearchPhotoResponse(
        searchPhotoLinksDto: SearchPhotoLinksDto.fromJson(json["links"]),
        id: json["id"],
        height: json["height"],
        width: json["width"],
        description: json["description"],
        blurHash: json["blur_hash"],
        color: json["color"],
        likes: json["likes"],
        searchPhotoUrlDto: SearchPhotoUrlDto.fromJson(json["urls"]));
  }

  SearchPhoto toEntity() =>
      SearchPhoto(searchPhotoLinks: searchPhotoLinksDto.toEntity(),
          id: id,
          height: height,
          width: width,
          description: description,
          blurHash: blurHash,
          color: color,
          likes: likes,
          searchPhotoUrl: searchPhotoUrlDto.toEntity());
}

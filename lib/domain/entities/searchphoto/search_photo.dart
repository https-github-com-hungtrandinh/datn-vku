import 'package:clean_architecture/domain/entities/searchphoto/search_photo_links.dart';
import 'package:clean_architecture/domain/entities/searchphoto/search_photo_url.dart';

class SearchPhoto {
  final String id;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final String description;
  final SearchPhotoUrl searchPhotoUrl;
  final SearchPhotoLinks searchPhotoLinks;
  final int likes;

  SearchPhoto(
      {required this.searchPhotoLinks,
      required this.id,
      required this.height,
      required this.width,
      required this.description,
      required this.blurHash,
      required this.color,
      required this.likes,
      required this.searchPhotoUrl});
}

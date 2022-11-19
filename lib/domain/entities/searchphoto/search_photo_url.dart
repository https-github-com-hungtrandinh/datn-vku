
class SearchPhotoUrl {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  const SearchPhotoUrl({required this.smallS3,
    required this.raw,
    required this.full,
    required this.regular,
    required this.thumb,
    required this.small});
}
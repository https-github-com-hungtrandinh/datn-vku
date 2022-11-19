import 'TopicsPreviewPhotoUrls.dart';

class TopicsPreviewPhotos {
  final String id;
  final String? createAt;
  final String? updateAt;
  final String? blurHash;
  final TopicsPreviewPhotoUrls topicsPreviewPhotoUrls;

  const TopicsPreviewPhotos(
      {required this.id,
        required this.topicsPreviewPhotoUrls,
        required this.createAt,
        required this.blurHash,
        required this.updateAt});
}
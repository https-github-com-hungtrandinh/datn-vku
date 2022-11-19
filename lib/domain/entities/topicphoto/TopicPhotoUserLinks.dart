class TopicPhotoUserLinks {
  final String self;
  final String html;
  final String photos;
  final String? likes;
  final String following;
  final String followers;

  TopicPhotoUserLinks(
      {required this.html,
      required this.self,
      required this.followers,
      required this.following,
      required this.likes,
      required this.photos});
}

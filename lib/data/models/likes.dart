class Likes {
  final String avatar;
  final String name;
  final String id;

  Likes({required this.avatar, required this.name, required this.id});

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(avatar: json['avatar'], name: json['name'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class User {
  final String avatar;
  final String background;
  final String? role;
  final bool? isEmailVerified;
  final bool? isTwoFactor;
  final String? smsCode;
  final List<String> friends;
  final List<String> followers;
  final List<String> followings;
  final List<String> notifications;
  final String? phoneNumber;
  final bool gender;
  final String email;
  final String name;
  final String id;

  User(
      {required this.avatar,
      required this.background,
      this.role,
      this.isEmailVerified,
      this.isTwoFactor,
      this.smsCode,
      required this.friends,
      required this.followers,
      required this.followings,
      required this.notifications,
      this.phoneNumber,
      required this.gender,
      required this.email,
      required this.name,
      required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        avatar: json['avatar'],
        background: json['background'],
        role: json['role'],
        isEmailVerified: json['isEmailVerified'],
        isTwoFactor: json['isTwoFactor'],
        smsCode: json['SMScode'],
        friends: json['friends'],
        followers: (json['followers'] as List)
            .map((followers) => followers.toString())
            .toList(),
        followings: (json['followings'] as List)
            .map((followings) => followings.toString())
            .toList(),
        notifications: (json['notifications'] as List)
            .map((notifications) => notifications.toString())
            .toList(),
        phoneNumber: json['phoneNumber'],
        gender: json['gender'],
        email: json['email'],
        name: json['name'],
        id: json['id']);
  }
}

class User {
  final String uid;
  final String name;
  final String gender;
  final int age;
  final String email;

  User(
      {required this.name,
      required this.gender,
      required this.age,
      required this.email,
      required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
        name: json['name'],
        gender: json['gender'],
        age: json['age'],
        email: 'email');
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'email': email,
      'uid':uid
    };
  }
}

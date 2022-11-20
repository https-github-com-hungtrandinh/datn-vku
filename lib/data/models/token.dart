class Tokens {
  final Access access;
  final Access refresh;

  Tokens({required this.access, required this.refresh});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
        access: Access.fromJson(json['access']),
        refresh: Access.fromJson(json['refresh']));
  }
}

class Access {
  final String token;
  final String expires;

  Access({required this.token, required this.expires});

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(token: json['token'], expires: json['expires']);
  }
}

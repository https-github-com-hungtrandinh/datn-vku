class UidUserRecommendation {
  final List<String> data;
  final String message;
  final int statusCode;

  UidUserRecommendation(
      {required this.data, required this.message, required this.statusCode});

  factory UidUserRecommendation.fromJson(Map<String, dynamic> json) {
    return UidUserRecommendation(
        data: (json["data"] as List).map((uid) => uid.toString()).toList(),
        message: json["message"],
        statusCode: json["status_code"]);
  }
}

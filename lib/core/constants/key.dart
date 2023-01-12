class ConstApp {
  static const String baseUrl = "http://127.0.0.1:8080/api/recommended-system/";
  static const String keyApi = "5IFGi9p0CqcZxupJ1ZV9ZUAoXddSBuRGYMW2cjKEvv8";
  static const String currentUnsplashTopics =
      "${baseUrl}topics?client_id=${keyApi}&per_page=30";

  static const baseUrlHeroku ="https://server-social-media.herokuapp.com/";
  static const header = 'application/json';
}

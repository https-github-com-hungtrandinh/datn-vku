class ConstApp {
  static const String baseUrl = "https://api.unsplash.com/";
  static const String keyApi = "5IFGi9p0CqcZxupJ1ZV9ZUAoXddSBuRGYMW2cjKEvv8";
  static const String currentUnsplashTopics =
      "${baseUrl}topics?client_id=${keyApi}&per_page=30";

  static const baseUrlHeroku ="https://server-social-media.herokuapp.com/";
  static const header = 'application/json';
}

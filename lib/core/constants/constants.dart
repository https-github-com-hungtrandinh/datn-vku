class Url {
  static const String baseUrl = "http://0.0.0.0:8088/api/recommended-system/";
  static const String apiKey = "cc95d932d5a45d33a9527d5019475f2c";
  static String currentWeatherByCityName(String cityName) =>
      '$baseUrl/weather?q=$cityName&appid=$apiKey';
}

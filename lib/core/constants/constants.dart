class Url {
  static const String baseUrl = "https://api.openweathermap.org/data/2.5";
  static const String apiKey = "cc95d932d5a45d33a9527d5019475f2c";
  static String currentWeatherByCityName(String cityName) =>
      '$baseUrl/weather?q=$cityName&appid=$apiKey';
}

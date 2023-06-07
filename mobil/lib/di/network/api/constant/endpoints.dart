class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:8081";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(seconds: 30);
  // connectTimeout
  static const Duration connectionTimeout = Duration(seconds: 30);

  static const String getSearchGame = '$baseUrl/game/getSearchGame';
  static const String saveComment = '$baseUrl/game/save/comment';
  static const String wallet = '$baseUrl/game/wallet/';
  static const String buyGame = '$baseUrl/game/buy';


}
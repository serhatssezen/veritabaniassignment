import 'package:assignment/models/Game.dart';
import 'package:dio/dio.dart';

import '../network/api/game/games_api.dart';
import '../network/dio_exception.dart';

class GamesRepository {
  final GamesApi gamesApi;

  GamesRepository(this.gamesApi);

  Future<List<Game>> getGames(String name, List<int> platforms, List<int> genres) async {
    try {
      final response = await gamesApi.getGames(name, platforms, genres);
      return (response.data as List)
          .map((x) => Game.fromJson(x))
          .toList();
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
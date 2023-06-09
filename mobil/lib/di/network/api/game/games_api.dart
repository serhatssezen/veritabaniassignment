import 'package:dio/dio.dart';
import '../../dio_client.dart';
import '../constant/endpoints.dart';

class GamesApi {
  final DioClient dioClient;

  GamesApi({required this.dioClient});

  Future<Response> getGames(String name, List<int> platforms, List<int> genres) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.getSearchGame,
        data: {
          'name': name,
          'platforms': platforms,
          'genres': genres
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> saveComment(int userId, int gameId, String comment) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.saveComment,
        data: {
          'userId': userId,
          'gameId': gameId,
          'comment': comment
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
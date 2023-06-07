import 'package:dio/dio.dart';
import '../../../../models/PaymentType.dart';
import '../../dio_client.dart';
import '../constant/endpoints.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> getUserWallet(String userId) async {
    try {
      final Response response = await dioClient.get(
        Endpoints.wallet + userId
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> buyGame(int userId, List<int> gameId, double totalPrice, PaymentType paymentType) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.buyGame,
        data: {
          'userId': userId,
          'gameId': gameId,
          'totalPrice': totalPrice,
          'paymentType': paymentType
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
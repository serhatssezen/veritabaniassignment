import 'dart:ffi';

import 'package:assignment/di/network/api/user/user_api.dart';
import 'package:dio/dio.dart';

import '../../models/PaymentType.dart';
import '../network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<int> getWallet(String userId) async {
    try {
      final response = await userApi.getUserWallet(userId);
      return (response.data as int);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<int> buyGame(int userId, List<int> gameId, double totalPrice, PaymentType paymentType) async {
    try {
      final response = await userApi.buyGame(userId, gameId, totalPrice, paymentType);
      return (response.data as int);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
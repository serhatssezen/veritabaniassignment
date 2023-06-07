import 'package:assignment/di/network/api/game/games_api.dart';
import 'package:assignment/di/repository/games_repository.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  getIt.registerSingleton(GamesApi(dioClient: getIt<DioClient>()));

  getIt.registerSingleton(GamesRepository(getIt.get<GamesApi>()));
}
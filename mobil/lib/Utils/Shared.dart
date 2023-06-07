import 'package:assignment/models/Game.dart';
import 'package:assignment/models/GamePrices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Map<Game, GamePrices> cartGameList = {}; // Initialize as an empty map
  static BuildContext? currentContext;
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

  saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool?> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
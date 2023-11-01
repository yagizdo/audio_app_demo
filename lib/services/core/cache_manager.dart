import 'package:hive_flutter/adapters.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;

  CacheManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
  }
}
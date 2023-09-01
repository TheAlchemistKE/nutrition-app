import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  SharedPreferences? _instance;

  Future<SharedPreferences> get store async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<String?> getString(String key) async {
    final prefs = await store;
    return prefs.getString(key);
  }

  Future<bool> saveString(String key, item) async {
    final prefs = await store;
    return prefs.setString(key, item);
  }

  Future<bool> delete(String key) async {
    final prefs = await store;
    return prefs.remove(key);
  }
}

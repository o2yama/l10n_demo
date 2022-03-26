import 'package:shared_preferences/shared_preferences.dart';

class PrefsRepository {
  factory PrefsRepository() => _cache;
  PrefsRepository._internal();
  static final _cache = PrefsRepository._internal();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLang(String lang) async {
    await _prefs.setString('langCode', lang);
  }

  String? get langCode {
    return _prefs.getString('langCode');
  }
}

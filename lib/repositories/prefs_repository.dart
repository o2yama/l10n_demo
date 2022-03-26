import 'package:shared_preferences/shared_preferences.dart';

class PrefsRepository {
  factory PrefsRepository() => _cache;
  PrefsRepository._internal();
  static final _cache = PrefsRepository._internal();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLang(String languageCode) async {
    await _prefs.setString('languageCode', languageCode);
  }

  String? get langCode {
    return _prefs.getString('languageCode');
  }
}

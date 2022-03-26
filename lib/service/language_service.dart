class LanguageService {
  static String languageCode = 'en';

  static final Map<String, Map<String, String>> _values = {
    'en': {
      'title': 'Hello, World!',
      'language': 'English',
      'googleLogin': 'Login with Google',
    },
    'ja': {
      'title': 'こんにちは、世界',
      'language': '日本語',
      'googleLogin': 'Googleログイン',
    }
  };

  static set languageCodeSetter(String lang) {
    languageCode = lang;
  }

  static String get title {
    return _values[languageCode]!['title']!;
  }

  static String get language {
    return _values[languageCode]!['language']!;
  }

  static String get googleLogin {
    return _values[languageCode]!['googleLogin']!;
  }
}

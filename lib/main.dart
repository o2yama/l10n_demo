import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:l10n_demo/pages/home_page.dart';
import 'package:l10n_demo/repositories/prefs_repository.dart';
import 'package:l10n_demo/service/language_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsRepository().init();

  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        final storedLanguageCode = PrefsRepository().langCode;

        if (storedLanguageCode == null) {
          final isDeviceLocaleSupported = supportedLocales
              .map((e) => e.languageCode)
              .contains(deviceLocale?.languageCode);

          isDeviceLocaleSupported
              ? LanguageService.languageCodeSetter = deviceLocale!.languageCode
              : LanguageService.languageCodeSetter = 'en';
        } else {
          LanguageService.languageCodeSetter = storedLanguageCode;
        }

        debugPrint('LanguageCode: ${LanguageService.languageCode}');

        return Locale(LanguageService.languageCode);
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

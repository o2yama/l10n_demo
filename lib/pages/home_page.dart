import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:l10n_demo/repositories/prefs_repository.dart';
import 'package:l10n_demo/service/language_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LanguageService.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LanguageService.language),
            Text(LanguageService.googleLogin),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text('Language'),
                children: [
                  ListTile(
                    onTap: () async {
                      await PrefsRepository().setLang('en');
                      Phoenix.rebirth(context);
                    },
                    title: const Text('English'),
                  ),
                  ListTile(
                    onTap: () async {
                      await PrefsRepository().setLang('ja');
                      Phoenix.rebirth(context);
                    },
                    title: const Text('日本語'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

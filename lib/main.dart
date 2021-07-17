import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/themes.dart';
import 'package:gmail_clone/models/mail.dart';
import 'package:gmail_clone/screens/main_screen.dart';
import 'package:gmail_clone/translations/codegen_loader.g.dart';

// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"

// flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('he')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    assetLoader: CodegenLoader(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  void setTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode getTheme() {
    return _themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      theme: appThemeData[AppTheme.Light],
      darkTheme: appThemeData[AppTheme.Dark],
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MainScreen(),
    );
  }
}

Color getProfileColor(Mail mail) {
  int formulaResult = 0;
  for (var item in mail.sender.characters) {
    formulaResult += (item.codeUnits.first + 22 / 5).toInt();
  }
  var profileColor = Colors.primaries[formulaResult % Colors.primaries.length];
  return profileColor;
}

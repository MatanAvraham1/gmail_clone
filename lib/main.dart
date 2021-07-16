import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/themes.dart';
import 'package:gmail_clone/models/mail.dart';
import 'package:gmail_clone/screens/main_screen.dart';

void main() {
  runApp(MyApp());
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

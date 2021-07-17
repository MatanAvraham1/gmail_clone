// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "to_me": "to me",
  "Inbox": "Inbox",
  "Archive": "Archive",
  "Starred": "Starred",
  "Trash": "Trash",
  "archived": "archived",
  "search_mail": "search mail",
  "Cancel": "Cancel"
};
static const Map<String,dynamic> he = {
  "to_me": "אל אני",
  "Inbox": "תיבת דואר נכנס",
  "Archive": "ארכיון",
  "Starred": "מסומן בכוכב",
  "Trash": "אשפה",
  "archived": "הועבר לארכיון",
  "search_mail": "חפש מייל",
  "Cancel": "בטל"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "he": he};
}

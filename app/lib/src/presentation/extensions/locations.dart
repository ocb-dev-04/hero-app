import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

extension StringTranslate on String {
  /// Translate a string using the current locale from i18n .json files
  String translate(BuildContext context) =>
      FlutterI18n.translate(context, this);
}

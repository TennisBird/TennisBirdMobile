import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  static Widget localWrapper(Widget child) {
    return EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'packages/core/assets/languages',
        fallbackLocale: const Locale('en'),
        child: child);
  }
}

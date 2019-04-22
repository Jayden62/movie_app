import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/LocalizationsUtil.dart';

class LocalizationsDelegateUtil extends LocalizationsDelegate<LocalizationsUtil> {
  const LocalizationsDelegateUtil();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<LocalizationsUtil> load(Locale locale) {
    return SynchronousFuture<LocalizationsUtil>(LocalizationsUtil(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegateUtil old) => false;
}

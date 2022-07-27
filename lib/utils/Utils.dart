import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../src/language/LocalizationService.dart';

class Utils {
  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static languageVietnamese() {
    LocalizationService.changeLocale(LocalizationService.langCodes[1]);
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

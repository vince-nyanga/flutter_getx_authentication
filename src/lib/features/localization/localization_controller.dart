import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale locale;

  @override
  void onInit() {
    locale = Locale('en', '');
    super.onInit();
  }

  setLocale(Locale locale) {
    this.locale = locale;
    Get.updateLocale(this.locale);
    update();
  }
}

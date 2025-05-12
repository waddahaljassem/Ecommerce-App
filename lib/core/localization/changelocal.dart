import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../functions/fcmconfig.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Please enable location services");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warning",
            "Please grant the app permission to access your location");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning",
          "The app cannot be used without enabling location services");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPermissionLocation();
    String? sharedprefLang = myServices.sharedPreferences.getString("lang");
    if (sharedprefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedprefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}

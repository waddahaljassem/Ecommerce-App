import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../view/screen/notification.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    HomePage(),
    NotificationView(),
    OffersView(),
    Settings(),
  ];

  List buttonappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notifications", "icon": Icons.notifications},
    {"title": "Offers", "icon": Icons.local_offer},
    {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}

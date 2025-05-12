import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  bool shouldExit = false;

  await Get.defaultDialog(
    title: "46".tr,
    middleText: "47".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          shouldExit = true;
          exit(0);
        },
        child: Text("48".tr),
      ),
      ElevatedButton(
        onPressed: () {
          shouldExit = false;
          Get.back();
        },
        child: Text("49".tr),
      ),
    ],
  );

  return shouldExit;
}

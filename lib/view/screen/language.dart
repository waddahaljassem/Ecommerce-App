import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 20),
            CustomButtonLang(
              textbutton: "2".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonLang(
              textbutton: "3".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}

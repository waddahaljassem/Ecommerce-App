import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      height: 40,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        //child: Text("4".tr),
      ),
    );
  }
}

import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/view/widget/onborading/custombutton.dart';
import 'package:ecommerce/view/widget/onborading/customslider.dart';
import 'package:ecommerce/view/widget/onborading/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

// ignore: camel_case_types
class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: 
            CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(children: [
                CustomDotControllerOnBoarding(),
                Spacer(flex: 3),
                CustomButtonOnBoarding(),
              ])),
        ],
      ),
    ));
  }
}

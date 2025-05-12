import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardingList[i].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.black),
                ),
                SizedBox(height: 80),
                Image.asset(
                  onBoardingList[i].image!,
                  //width: 200,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    style: TextStyle(
                        height: 2,
                        color: AppColor.gray,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ));
  }
}

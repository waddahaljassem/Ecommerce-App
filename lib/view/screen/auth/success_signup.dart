import 'package:ecommerce/controller/auth/successsignup_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text("42".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.gray)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "44".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 30),
            Text("43".tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "45".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

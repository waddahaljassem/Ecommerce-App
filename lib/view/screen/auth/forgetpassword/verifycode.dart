import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("31".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColor.gray)),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
              CustomTextTitleAuth(
                text: "32".tr,
              ),
              SizedBox(height: 10),
              CustomTextBodyAuth(text: "34".tr),
              SizedBox(height: 15),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  controller.goToResetPassword(verificationCode);
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}

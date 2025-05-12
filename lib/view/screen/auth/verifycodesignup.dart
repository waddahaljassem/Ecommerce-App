import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../controller/auth/verifycodesignup_controller.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
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
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(
                  children: [
                    CustomTextTitleAuth(
                      text: "32".tr,
                    ),
                    SizedBox(height: 10),
                    CustomTextBodyAuth(
                        text: "34".tr + "${controller.email}".tr),
                    SizedBox(height: 15),
                    OtpTextField(
                      fieldWidth: 50.0,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.goToSuccessSignUp(verificationCode);
                      },
                    ),
                    SizedBox(height: 30),
                    InkWell(onTap: (){
                      controller.reSend();
                    }, child: Center(child: Text("Resend Verify Code" , style: TextStyle(color: AppColor.primaryColor, fontSize: 20),)),)
                  ],
                ),
              )),
        ));
  }
}

import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextsignuporsignIn.dart';
import '../../widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0.0,
        title: Text("22".tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.gray)),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExitApp();
        },
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate2,
                  child: ListView(
                    children: [
                      CustomTextTitleAuth(
                        text: "14".tr,
                      ),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(text: "27".tr),
                      SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        hinttext: "23".tr,
                        labeltext: "24".tr,
                        iconData: Icons.person_outlined,
                        mycontroller: controller.username,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        hinttext: "25".tr,
                        labeltext: "26".tr,
                        iconData: Icons.phone_android_outlined,
                        mycontroller: controller.phone,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        hinttext: "16".tr,
                        labeltext: "17".tr,
                        iconData: Icons.email_outlined,
                        mycontroller: controller.email,
                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                      ),
                      GetBuilder<SignUpControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                                abscureText: controller.isshowpassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                isNumber: false,
                                hinttext: "18".tr,
                                labeltext: "19".tr,
                                iconData: Icons.lock_outline,
                                mycontroller: controller.password,
                                valid: (val) {
                                  return validInput(val!, 4, 30, "password");
                                },
                              )),
                      CustomButtonAuth(
                        text: "22".tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextSignUpOrSignIn(
                        onTap: () {
                          controller.goToSignIn();
                        },
                        textone: '28'.tr,
                        texttwo: '13'.tr,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

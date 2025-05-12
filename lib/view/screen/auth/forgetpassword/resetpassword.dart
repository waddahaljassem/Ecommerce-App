import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("35".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColor.gray)),
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate4,
                  child: ListView(
                    children: [
                      CustomTextTitleAuth(
                        text: "36".tr,
                      ),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(text: "37".tr),
                      SizedBox(height: 15),
                      GetBuilder<ResetPasswordControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          abscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          valid: (val) {
                            return validInput(val!, 3, 40, "password");
                          },
                          hinttext: "39".tr,
                          labeltext: "18".tr,
                          iconData: Icons.lock_outline,
                          mycontroller: controller.password,
                          isNumber: false,
                        ),
                      ),
                      GetBuilder<ResetPasswordControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          abscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          valid: (val) {
                            return validInput(val!, 3, 40, "password");
                          },
                          hinttext: "Re ${"40".tr}",
                          labeltext: "18".tr,
                          iconData: Icons.lock_outline,
                          mycontroller: controller.repassword,
                          isNumber: false,
                        ),
                      ),
                      CustomButtonAuth(
                        text: "38".tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )),
        ));
  }
}

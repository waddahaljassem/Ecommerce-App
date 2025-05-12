import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("20".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColor.gray)),
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate3,
                  child: ListView(
                    children: [
                      CustomTextTitleAuth(
                        text: "29".tr,
                      ),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(text: "33".tr),
                      SizedBox(height: 15),
                      CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 40, "email");
                          },
                          hinttext: "16".tr,
                          labeltext: "17".tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email),
                      CustomButtonAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.checkemail();
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

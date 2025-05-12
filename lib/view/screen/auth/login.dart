import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/cutomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextsignuporsignIn.dart';
import '../../widget/auth/customtexttitleauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          title: Text("13".tr,
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
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate1,
                    child: ListView(
                      children: [
                        LogoAuth(),
                        CustomTextTitleAuth(
                          text: "14".tr,
                        ),
                        SizedBox(height: 10),
                        CustomTextBodyAuth(text: "15".tr),
                        SizedBox(height: 15),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          hinttext: "16".tr,
                          labeltext: "17".tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email, isNumber: false,
                          //mycontroller: mycontroller)
                        ),
                        GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  abscureText: controller.isshowpassword,
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 4, 30, "password");
                                  },
                                  hinttext: "18".tr,
                                  labeltext: "19".tr,
                                  iconData: Icons.lock_outline,
                                  mycontroller: controller.password,
                                  //mycontroller: mycontroller)
                                )),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "20".tr,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        CustomButtonAuth(
                          text: "13".tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        SizedBox(height: 30),
                        CustomTextSignUpOrSignIn(
                            textone: "21".tr,
                            texttwo: "22".tr,
                            onTap: () {
                              controller.goToSignUp();
                            }),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}

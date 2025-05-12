import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate1.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences.setString(
              "id",
              response['data']['users_id'].toString(),
            );
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString(
              "username",
              response['data']['users_name'],
            );
            myServices.sharedPreferences.setString(
              "email",
              response['data']['users_email'],
            );
            myServices.sharedPreferences.setString(
              "phone",
              response['data']['users_phone'],
            );
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homepage);
          } else {
            Get.toNamed(
              AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text},
            );
          }
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or Password Not Correct",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}

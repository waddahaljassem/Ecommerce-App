import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate3 = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkemail() async {
    if (formstate3.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Not Found");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}

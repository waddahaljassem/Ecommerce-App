import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
  reSend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postdata(
      email!,
      verifyCodeSignUp,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verify Code Not Correct",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verifyCodeSignUpData.resendData(email!);
  }
}

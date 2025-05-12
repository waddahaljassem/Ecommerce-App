import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

class AddressAddDetailsController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;

    update();

    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Warning", "Now, You Can Order To This Address");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}

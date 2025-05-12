import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';
import 'home_controller.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata1 = response['data'];
        data.addAll(listdata1.map(
          (e) => ItemsModel.fromJson(e),
        ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}

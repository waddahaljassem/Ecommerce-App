import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catval);
  getItems(String CategoryId);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catid;

  ItemsData itemsData = ItemsData(Get.find());

  String deliverytime = "";

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    initialData();

    super.onInit();
  }

  initialData() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(CategoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      CategoryId,
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

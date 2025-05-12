import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  int countitems = 0;

  CartData cartData = CartData(Get.find());

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    countitems = await getCountItems(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "أشعار", messageText: Text("تم أضافة المنتج الى السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "أشعار", messageText: Text("تم ازالة المنتج من السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response['data'];
        print("=====================================");
        print("$countitems");

        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  List subitems = [
    {
      "name": "Red",
      "id": 1,
      "active": "0",
    },
    {
      "name": "Blue",
      "id": 2,
      "active": "0",
    },
    {
      "name": "Red",
      "id": 3,
      "active": "1",
    }
  ];

  add() {
    addCart(itemsModel.itemsId!.toString());
    countitems++;
    update();
  }

  remove() {
    removeCart(itemsModel.itemsId!.toString());
    if (countitems > 0) {
      countitems--;
    }
    update();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }
}

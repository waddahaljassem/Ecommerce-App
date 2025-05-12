import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
          title: "أشعار",
          messageText: Text("تم أضافة المنتج الى المفضلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "أشعار",
          messageText: Text("تم حذف المنتج من المفضلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}

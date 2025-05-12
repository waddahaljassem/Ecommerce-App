import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryId);
}

class HomeControllerImp extends SearchMixController {
  MyServices myServices = Get.find();

  String? username;

  String? lang;

  String titlehomeCard = "";

  String bodyhomeCard = "";
  String deliverytime = "";

  HomeData homeData = HomeData(Get.find());

  //List data = [];
  List categories = [];
  List items = [];

  List settingsdata = [];

  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingsdata.addAll(response['settings']['data']);
        titlehomeCard = settingsdata[0]['settings_titlehome'];
        bodyhomeCard = settingsdata[0]['settings_bodyhome'];
        deliverytime = settingsdata[0]['settings_deliverytime'].toString();

        myServices.sharedPreferences.setString("deliverytime", deliverytime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItems(categories, selectedCat, categoryId) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "catid": categoryId,
      },
    );
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  bool isSearch = false;
  TextEditingController? search;
  List<ItemsModel> listdata = [];

  HomeData homeData = HomeData(Get.find());
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

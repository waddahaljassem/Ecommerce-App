import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  CouponModel couponModel = CouponModel();

  int? discountcoupon = 0;

  String? couponname;
  String? couponid;

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
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
          messageText: Text("تم أضافة المنتج الى السلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("Warning", "The cart is empty");
    Get.toNamed(
      AppRoute.checkout,
      arguments: {
        "couponid": couponid ?? "0",
        "priceorder": priceorders.toString(),
        "discountcoupon": discountcoupon.toString(),
      },
    );
  }

  removeCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
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
          messageText: Text("تم ازالة المنتج من السلة"),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel.couponDiscount;
        couponname = couponModel.couponName;
        couponid = couponModel.couponId.toString();
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid");
      }
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responsedata = response['datacart']['data'];
          Map responsedatacountprice = response['countprice'];
          data.clear();
          data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
          totalcountitems = responsedatacountprice['totalcount'];
          priceorders = double.parse(
            responsedatacountprice['totalprice'].toString(),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}

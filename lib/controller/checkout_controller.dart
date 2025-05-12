import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String? priceorders;

  List<AddressModel> dataaddress = [];

  StatusRequest statusRequest = StatusRequest.none;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please Select a payment Method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please Select a order Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "Please Select Shipping Address");
    }
    statusRequest = StatusRequest.loading;

    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id").toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10".toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "ordersprice": priceorders.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "The Order was Successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Warning Error", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'];

    getShippingAddress();
    super.onInit();
  }
}

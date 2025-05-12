import 'package:ecommerce/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveOrdersData archiveordersData = ArchiveOrdersData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    }
    return "Receive";
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on Delivery";
    }
    return "Payment Card";
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared";
    } else if (val == "2") {
      return "On The Way";
    } else if (val == "3") {
      return "Ready To Picked up by Delivery Man ";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveordersData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveordersData.rating(
      ordersid,
      comment,
      rating.toString(),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}

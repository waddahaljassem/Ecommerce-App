import 'dart:async';

import 'package:ecommerce/data/datasource/remote/orders/details_data.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();

  CameraPosition? cameraPosition;

  List<Marker> markers = [];

  double? lat;

  double? long;

  OrdersDetailsData ordersdetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  initialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!),
        ),
        zoom: 12.4746,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(
            double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!),
          ),
        ),
      );
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersdetailsData.getData(ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getData();
    super.onInit();
  }
}

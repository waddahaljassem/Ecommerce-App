import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(
      AppRoute.addressadddetails,
      arguments: {"lat": lat.toString(), "long": long.toString()},
    );
  }

  Position? position;

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();

    kGooglePlex = CameraPosition(
      target: LatLng(position!.altitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.altitude, position!.longitude));

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}

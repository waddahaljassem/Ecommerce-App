import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));

        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

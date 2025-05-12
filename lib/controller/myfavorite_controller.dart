import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavorite_data.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map(
          (e) => MyFavoriteModel.fromJson(e),
        ));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();

    myfavoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);

    update();
  }

  onInit() {
    getData();

    super.onInit();
  }
}

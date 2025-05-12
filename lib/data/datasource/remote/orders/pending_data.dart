import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.deleteOrders, {
      "id": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}

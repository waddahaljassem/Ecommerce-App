import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveOrders, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String comment, String rating) async {
    var response = await crud.postData(
        AppLink.rating, {"id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}

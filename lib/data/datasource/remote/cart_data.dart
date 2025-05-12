import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartAdd, {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartRemove,
        {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartGetCountItems,
        {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response =
        await crud.postData(AppLink.cartView, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkCoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}

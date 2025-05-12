import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.favoriteAdd,
        {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.favoriteRemove,
        {"usersid": usersid.toString(), "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}

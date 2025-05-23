import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postdata(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}

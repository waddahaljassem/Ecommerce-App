import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/address/add.dart';
import 'package:ecommerce/view/address/view.dart';

import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/details.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:get/get.dart';

import 'core/middleware/mymiddleware.dart';
import 'view/address/adddetails.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/language.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => Cart()),
  // GetPage(name: "/", page: () => ProductDetails()),
  GetPage(name: AppRoute.cart, page: () => Cart()),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoute.successSignup, page: () => SuccessSignUp()),
  GetPage(
      name: AppRoute.successResetpassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => VerifyCodeSignUp()),

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => onBoarding()),

  //
  GetPage(name: AppRoute.homepage, page: () => HomeScreen()),
  GetPage(name: AppRoute.items, page: () => Items()),

  GetPage(
    name: AppRoute.productdetails,
    page: () => ProductDetails(),
  ),
  GetPage(
    name: AppRoute.myfavorite,
    page: () => MyFavorite(),
  ),

  // Address
  GetPage(
    name: AppRoute.addressview,
    page: () => AddressView(),
  ),
  GetPage(
    name: AppRoute.addressadd,
    page: () => AddressAdd(),
  ),

  GetPage(name: AppRoute.addressadddetails, page: () => AddressAddDetails()),

  GetPage(name: AppRoute.checkout, page: () => Checkout()),
  GetPage(name: AppRoute.ordersPending, page: () => OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => OrdersDerails()),
  GetPage(name: AppRoute.ordersArchive, page: () => OrdersArchiveView()),
  GetPage(name: AppRoute.offers, page: () => OffersView()),
];

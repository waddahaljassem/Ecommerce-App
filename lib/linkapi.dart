class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";

  static const String imagestatic = "http://10.0.2.2/ecommerce/upload";

  static const String test = "$server/test.php";

  // =====================  Images ======================

  static const String imagescategories = "$imagestatic/categories";
  static const String imagesitems = "$imagestatic/items";

  //========================Auth//========================

  static const String signup = "$server/auth/signup.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";

  //==================ForgetPassword======================

  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

//=======================Home======================

  static const String homepage = "$server/home.php";

  //====================== Items ===================
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

  //===================== Favorite =====================
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  //======================Cart==============================
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

  //==========================Address===========================
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  //============================Coupon==========================
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  //============================Checkout & Orders ===========================
  static const String checkOut = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archiveOrders = "$server/orders/archive.php";
  static const String detailsOrders = "$server/orders/details.php";
  static const String deleteOrders = "$server/orders/delete.php";

//================================Notification========================
  static const String notificationView = "$server/notification.php";

  //================================Offers========================
  static const String offers = "$server/offers.php";

  //================================Offers========================
  static const String rating = "$server/rating.php";
}

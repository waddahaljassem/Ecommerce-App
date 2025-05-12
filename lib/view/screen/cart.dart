import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/custom_bottom_navigation_bar_cart.dart';
import '../widget/cart/customitemscartlist.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottomNavigationBarCart(
            shipping: "10",
            controllercoupon: controller.controllercoupon!,
            onApplyCoupon: () {
              controller.checkCoupon();
            },
            price: "${cartController.priceorders}",
            discount: "${controller.discountcoupon}%",
            totalprice: "${controller.getTotalPrice()}",
          ),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TopCardCart(
                          message:
                              "You Have ${cartController.totalcountitems} Items In Your List"),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartController.data.length,
                              (index) => CustomItemsCartList(
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsprice} \$",
                                count:
                                    "${cartController.data[index].countitems}",
                                imagname:
                                    "${cartController.data[index].itemsImage}",
                                onAdd: () async {
                                  await cartController.addCart(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.removeCart(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}

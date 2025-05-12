import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/productdetails/priceandcount.dart';
import '../widget/productdetails/toppageproductdetils.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          height: 40,
          color: AppColor.secondColor,
          child: Text(
            "Go To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              TopPageProductDetails(),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.itemsModel.itemsName}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColor.secondColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PriceAndCount(
                      count: "${controller.countitems}",
                      price: "${controller.itemsModel.itemsPriceDiscount}",
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "${controller.itemsModel.itemsDesc}, ${controller.itemsModel.itemsDesc},${controller.itemsModel.itemsDesc}, ${controller.itemsModel.itemsDesc}, ${controller.itemsModel.itemsDesc}, ${controller.itemsModel.itemsDesc}",
                        style: Theme.of(context).textTheme.bodyLarge!),
                    SizedBox(height: 10),
                    // Text(
                    //   "Color",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .headlineMedium!
                    //       .copyWith(color: AppColor.secondColor),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // SubItemsList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

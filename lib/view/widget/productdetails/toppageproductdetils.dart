import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.secondColor,
          ),
        ),
        Positioned(
          top: 30.0,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Image.network(
              fit: BoxFit.fill,
              "${AppLink.imagesitems}/${controller.itemsModel.itemsImage}",
              height: 250,
            ),
          ),
        )
      ],
    );
  }
}

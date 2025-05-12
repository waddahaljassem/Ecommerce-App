import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColor.secondColor
                    : Colors.white,
                border: Border.all(color: AppColor.secondColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subitems[index]['name'].toString(),
              style: TextStyle(
                  color: controller.subitems[index]['active'] == "1"
                      ? Colors.white
                      : AppColor.secondColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

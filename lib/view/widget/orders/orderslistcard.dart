import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number: #${listdata.ordersId}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(),
            Text(
                "Order Type: ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order Price: ${listdata.ordersPrice} \$"),
            Text("Delivery Price: ${listdata.ordersPricedelivery} \$"),
            Text(
                "Order Status: ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            Text(
                "Payment Method: ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Divider(),
            Row(
              children: [
                Text(
                  "Total Price: ${listdata.ordersTotalprice} \$",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: Text("Details"),
                ),
                SizedBox(width: 10),
                if (listdata.ordersStatus! == "0")
                  MaterialButton(
                    onPressed: () {
                      controller.deleteOrders(listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: Text("Delete"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

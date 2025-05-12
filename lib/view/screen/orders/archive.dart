import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/orders/orderslistcardarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<ArchiveOrdersController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CardOrdersListArchive(
                            listdata: controller.data[index])),
                  )),
        ));
  }
}

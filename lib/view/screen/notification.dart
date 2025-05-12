import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/notification_controller.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(children: [
                    Center(
                        child: Text(
                      "Notification",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(height: 20),
                    ...List.generate(
                      controller.data.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Stack(children: [
                          ListTile(
                            title: Text(
                              controller.data[index]['notification_title'],
                            ),
                            subtitle: Text(
                              controller.data[index]['notification_body'],
                            ),
                          ),
                          Positioned(
                              right: 5,
                              child: Text(
                                Jiffy.parse(
                                  controller.data[index]
                                      ['notification_datetime'],
                                ).fromNow(),
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ]),
                      ),
                    )
                  ]),
                ),
              )),
    );
  }
}

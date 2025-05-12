import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/shared/custombutton.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/address/adddetails_controller.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressAddDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add details address"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: GetBuilder<AddressAddDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  CustomTextFormAuth(
                      hinttext: "City",
                      labeltext: "City",
                      iconData: Icons.location_city_outlined,
                      mycontroller: controller.city!,
                      valid: (p0) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Street",
                      labeltext: "Street",
                      iconData: Icons.streetview_outlined,
                      mycontroller: controller.street!,
                      valid: (p0) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Name Location",
                      labeltext: "Name Location",
                      iconData: Icons.near_me,
                      mycontroller: controller.name!,
                      valid: (p0) {},
                      isNumber: false),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress();
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

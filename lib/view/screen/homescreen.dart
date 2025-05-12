import 'dart:io';

import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomAppBarHome(),
              body: PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) {
                    Get.defaultDialog(
                      title: "Warning",
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                      middleText: "Are you Want to Exit App?",
                      onConfirm: () {
                        exit(0);
                      },
                      onCancel: () {},
                      cancelTextColor: AppColor.secondColor,
                      confirmTextColor: AppColor.secondColor,
                      buttonColor: AppColor.thirdColor,
                    );
                  },
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}

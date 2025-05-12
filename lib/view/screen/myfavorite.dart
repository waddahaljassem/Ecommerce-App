import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/myfavorite/cutomlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: "Find Product",
              //   onPressedSearch: () {},
              //   onPressedIconFavorite: () {
              //     Get.toNamed(AppRoute.myfavorite);
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                          itemsModel: controller.data[index]);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/offers/customitemsoffers.dart';
import 'home.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    Get.put(OffersController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    titleappbar: "Find Product",
                    //onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                CustomListItemsOffers(
                              itemsModel: controller.data[index],
                            ),
                            itemCount: controller.data.length,
                          ))
                      : ListItemsSearch(
                          listdatamodel: controller.listdata,
                        ),
                ],
              ),
            ));
  }
}

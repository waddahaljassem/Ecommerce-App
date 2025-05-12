import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(children: [
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
            SizedBox(height: 20),
            ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.7,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                controllerFav.isFavorite[controller.data[index]
                                        ["items_id"]] =
                                    controller.data[index]["favorite"];
                                return CustomListItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.data[index]),
                                );
                              })
                          : ListItemsSearch(
                              listdatamodel: controller.listdata,
                            ),
                    ))
          ])),
    );
  }
}

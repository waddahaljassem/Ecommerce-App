import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/home/customcardhome.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardHome(
                              title: "${controller.titlehomeCard}",
                              body: "${controller.bodyhomeCard}"),
                          CustomTitleHome(title: "Categories"),
                          ListCategoriesHome(),
                          CustomTitleHome(title: "Top Selling"),
                          ListItemsHome(),
                          CustomTitleHome(title: "Offers"),
                          ListItemsHome(),
                        ],
                      )
                    : ListItemsSearch(
                        listdatamodel: controller.listdata,
                      ),
              )
            ],
          )),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagesitems}/${listdatamodel[index].itemsImage}",
                    )),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

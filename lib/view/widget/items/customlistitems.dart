import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: Image.network(
                      "${AppLink.imagesitems}/${itemsModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    translateDatabase(
                        itemsModel.itemsNameAr!, itemsModel.itemsName!),
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.timer_sharp,
                          color: AppColor.gray,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${controller.deliverytime} Minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "sans"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount}\$",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.removeFavorite(
                                    itemsModel.itemsId!.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId, 1);
                                controller.addFavorite(
                                    itemsModel.itemsId!.toString());
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.primaryColor,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                  top: -4,
                  left: 4,
                  child: Image.asset(
                    AppImageAsset.discount,
                    width: 50,
                  ))
          ],
        ),
      ),
    );
  }
}

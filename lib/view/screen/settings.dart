import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    backgroundColor: AppColor.secondColor,
                    radius: 40,
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersPending);
                  },
                  title: Text("Orders"),
                  trailing: Icon(Icons.card_travel_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersArchive);
                  },
                  title: Text("Archive"),
                  trailing: Icon(Icons.archive_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: Text("Address"),
                  trailing: Icon(Icons.location_on_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  title: Text("About us"),
                  trailing: Icon(Icons.help_outline_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+963994429525"));
                  },
                  title: Text("Contact us"),
                  trailing: Icon(Icons.phone_callback_outlined),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : CustomButtonAppBar(
                        textbutton: controller.buttonappbar[i]["title"],
                        icondata: controller.buttonappbar[i]["icon"],
                        active: controller.currentpage == i ? true : false,
                        onPressed: () {
                          controller.changePage(i);
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

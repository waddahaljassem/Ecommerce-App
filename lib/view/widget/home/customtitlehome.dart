import 'package:flutter/widgets.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {super.key, required this.textone, required this.texttwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone.tr),
        InkWell(
            onTap: onTap,
            child: Text(texttwo.tr,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold)))
      ],
    );
  }
}

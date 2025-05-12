import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 5),
          onPressed: onPressed,
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}

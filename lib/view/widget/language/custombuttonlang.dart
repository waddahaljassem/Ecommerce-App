import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child: Text(
          textbutton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

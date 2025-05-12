import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  final String price;
  const PriceAndCount(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 2),
              width: 50,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Text(
                count,
                style: TextStyle(fontSize: 20, height: 1.1),
              ),
            ),
            IconButton(onPressed: onRemove, icon: Icon(Icons.remove))
          ],
        ),
        Spacer(),
        Text(
          "$price\$",
          style: TextStyle(
            height: 1.1,
            color: AppColor.primaryColor,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}

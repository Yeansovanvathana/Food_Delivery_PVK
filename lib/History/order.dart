import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/History/detail_order.dart';

import '../utils/color.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

class Order extends StatelessWidget {
  final double height;
  Map<String, dynamic> item;

  Order({
    Key? key,
    required this.height,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          SmallText(text: "From"),
          Expanded(child: Container()),
          SmallText(text: "PVK")
        ],
      ),
      SizedBox(
        height: height / 49.25,
      ),
      Row(
        children: [
          SmallText(text: "To"),
          Expanded(child: Container()),
          SmallText(text: item['name'])
        ],
      ),
      SizedBox(
        height: height / 49.25,
      ),
      Row(
        children: [
          SmallText(text: "Phone number"),
          Expanded(child: Container()),
          SmallText(text: "+855 ${item['phone']}")
        ],
      ),
      SizedBox(
        height: height / 49.25,
      ),
      Row(
        children: [
          SmallText(text: "Address"),
          Expanded(child: Container()),
          SmallText(text: item['address'])
        ],
      ),
      SizedBox(
        height: height / 49.25,
      ),
      Row(
        children: [
          SmallText(text: "Total"),
          Expanded(child: Container()),
          SmallText(text: "\$${item['total']}")
        ],
      ),
      SizedBox(
        height: height / 49.25,
      ),
      InkWell(
        child: Container(
          padding: EdgeInsets.all(height / 98.5),
          width: height / 5,
          height: height / 20,
          decoration: BoxDecoration(
            color: AppColors.darkGreen,
            borderRadius: BorderRadius.circular(height / 32.83),
          ),
          child: Text(
            "View Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height / 55, color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailOrder(
                      height: height,
                      item: item,
                    )),
          );
        },
      ),
    ]);
  }
}

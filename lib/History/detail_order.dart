import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/Confirm_order_page/item.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

import '../utils/color.dart';

class DetailOrder extends StatelessWidget {
  final double height;
  Map<String, dynamic> fooditem = {};
  Map<String, dynamic> item;
  double total = 0;

  DetailOrder({
    Key? key,
    required this.height,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fooditem = item['order'];
    for (var i in fooditem.keys) {
      total += fooditem[i].reduce((a, b) => a + b);
    }
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: height / 32.83,
            left: height / 49.25,
            right: height / 49.25,
            bottom: height / 32.83),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Customer Info",
                ),
                SizedBox(height: height / 39.4),
                Row(
                  children: [
                    SmallText(text: "Customer's Name"),
                    Expanded(child: Container()),
                    SmallText(text: item["name"])
                  ],
                ),
                SizedBox(
                  height: height / 49.25,
                ),
                Row(
                  children: [
                    SmallText(text: "Phone Number"),
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
                SizedBox(height: height / 65.66),
                Container(
                  padding: EdgeInsets.only(top: height / 49.25),
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: AppColors.darkGreen),
                ),
                SizedBox(height: 20),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Food order",
                ),
                SizedBox(height: height / 39.4),
                //item already order
                ...fooditem.entries.map((item) {
                  return Item(item: [
                    item.key,
                    item.value.length.toString(),
                    item.value.length > 0 ? item.value[0].toString() : "0"
                  ]);
                }),
                SizedBox(height: height / 65.66),
                Container(
                  padding: EdgeInsets.only(top: height / 49.25),
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: AppColors.darkGreen),
                ),
                //Delivery fee
                Container(
                  padding: EdgeInsets.only(top: height / 32.83),
                  child: Row(
                    children: [
                      SmallText(
                        text: "Delivery fee",
                      ),
                      Expanded(child: Container()),
                      Text(
                        r"$0.00",
                        style: TextStyle(
                            fontSize: height / 54.72,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: height / 98.5),
                  child: Row(
                    children: [
                      SmallText(
                        text: "Total amount",
                      ),
                      Expanded(child: Container()),
                      Text(
                        "\$$total",
                        style: TextStyle(
                            fontSize: height / 54.72,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    children: [
                      SmallText(
                        text: "Exchange rate",
                      ),
                      Expanded(child: Container()),
                      Text(
                        r"$1=4100 Riel",
                        style: TextStyle(
                            fontSize: height / 65.66,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

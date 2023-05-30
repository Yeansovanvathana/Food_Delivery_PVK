import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethod extends StatelessWidget {
  final Function refresh;
  final double totalAmount;
  PaymentMethod({
    Key? key,
    required this.refresh,
    required this.totalAmount,
  }) : super(key: key);
  String payment = '';

  Future<void> addItem(String key, String item) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, item);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(height / 24.625),
      height: height / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              BigText(text: "Choose Payment method"),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(
            height: height / 24.625,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: BigText(
                    text: "\$$totalAmount",
                  ),
                ),
                SizedBox(
                  height: height / 32.83,
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            width: height / 24.625,
                            height: height / 24.625,
                            child: const Icon(
                              Icons.attach_money,
                              color: AppColors.darkGreen,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: height / 49.25,
                        ),
                        Text("Cash"),
                        Expanded(child: Container()),
                        Icon(Icons.add_circle_outline)
                      ],
                    ),
                  ),
                  onTap: () async {
                    payment = "cash";
                    await addItem("payment", payment);
                    Navigator.pop(context);
                    refresh();
                  },
                ),
                SizedBox(
                  height: height / 32.83,
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            width: height / 24.625,
                            height: height / 24.625,
                            child: const Icon(
                              Icons.credit_card,
                              color: AppColors.darkGreen,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: height / 49.25,
                        ),
                        Text("VK point"),
                        Expanded(child: Container()),
                        Icon(Icons.add_circle_outline)
                      ],
                    ),
                  ),
                  onTap: () async {
                    payment = "VK point";
                    await addItem("payment", payment);
                    Navigator.pop(context);
                    refresh();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

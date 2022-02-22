import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
            height: 480,
            decoration: BoxDecoration(
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
                    Text(
                      "Cancle",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      Center(
                        child: BigText(
                          text: "3.00 dollars",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(
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
                              width: 20,
                            ),
                            Text("Cash"),
                            Expanded(child: Container()),
                            Icon(Icons.add_circle_outline)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(
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
                              width: 20,
                            ),
                            Text("Credit Card"),
                            Expanded(child: Container()),
                            Icon(Icons.add_circle_outline)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
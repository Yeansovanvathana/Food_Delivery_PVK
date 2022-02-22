import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

import '../widgets/icon_and_text.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            Row(
              children: [
                Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.darkGreen,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                Column(
                  children: [
                    BigText(
                      text: "Cart",
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
            Container(
              width: double.infinity,
              ///Change height for your device
              height: 700,
              // color: AppColors.darkGreen,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/Order.png")))),
                    SizedBox(height: 40),
                    Text(
                      "No items in the cart",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.darkGreen,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

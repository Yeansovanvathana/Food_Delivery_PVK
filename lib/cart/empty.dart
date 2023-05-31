import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

import '../widgets/icon_and_text.dart';

class Empty extends StatelessWidget {
  final Function navigateTo;

  const Empty({Key? key, required this.navigateTo}) : super(key: key);
  //This for Empty Cart when no customer select
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            Row(
              children: [
                Center(
                  child: InkWell(
                    child: Container(
                      width: height / 32.83,
                      height: height / 32.83,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height / 98.5),
                        color: AppColors.darkGreen,
                      ),
                    ),
                    onTap: () {
                      navigateTo("homepage");
                    },
                  ),
                ),
                SizedBox(
                  width: height / 32.83,
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
              height: height / 1.40,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: height / 6.56,
                        width: height / 6.56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height / 49.25),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/Order.png")))),
                    SizedBox(height: height / 24.625),
                    Text(
                      "No items in the cart",
                      style: TextStyle(
                          fontSize: height / 44.77,
                          fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: height / 21.88,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(height / 98.5),
                        width: height / 6.56,
                        height: height / 24.625,
                        decoration: BoxDecoration(
                          color: AppColors.darkGreen,
                          borderRadius: BorderRadius.circular(height / 32.83),
                        ),
                        child: Text(
                          "Order",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: height / 61.56, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        navigateTo("homepage");
                      },
                    )
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

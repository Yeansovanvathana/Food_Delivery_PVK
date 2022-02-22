import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';


class ChooseAddress extends StatelessWidget {
  const ChooseAddress({Key? key}) : super(key: key);

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
              BigText(text: "Choose address"),
              Expanded(child: Container()),
              Text(
                "Cancle",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
              )
            ],
          ),
          SizedBox(height: 40),
          Container(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightGreen),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "Borey R",
                              ),
                            ])),
                    Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: AppColors.lightGreen),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "Borey M",
                              ),
                            ])),
                    Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: AppColors.lightGreen),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: "Borey V",
                              ),
                            ])
                        // BigText(text: "Borey M"),

                        ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 310,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightGreen),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "J01",
                              style: TextStyle(fontSize: 18),
                            ),
                            Expanded(child: Container()),
                            Icon(Icons.check)
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "J01",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "J02",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "J03",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "J04",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

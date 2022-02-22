import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

import 'Choose_address.dart';
import 'Payment_method.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  _showModelBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(child: const ChooseAddress());
        });
  }

  _showModelBottomCase(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(child: const PaymentMethod());
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.darkGreen,
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
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45,
                ),
                Column(
                  children: [
                    BigText(
                      text: "Confirm Order",
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            RawMaterialButton(
              onPressed: () {
                _showModelBottomSheet(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      // bottomLeft: Radius.circular(10),
                      // bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.pin_drop_rounded,
                            color: AppColors.darkGreen,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightGreen,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      SmallText(
                        text: "Select address",
                        color: AppColors.darkGreen,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.darkGreen,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1),
            RawMaterialButton(
              onPressed: () {
                _showModelBottomCase(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      // topRight: Radius.circular(5),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      )
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                          width: 30,
                          height: 30,
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
                      Expanded(child: Container()),
                      SmallText(
                        text: "Payment method",
                        color: AppColors.darkGreen,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.darkGreen,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Food order",
                    ),
                    SizedBox(height: 25),
                    Container(
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              child: Text(
                                "1x",
                                style: TextStyle(fontSize: 15),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightGreen,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SmallText(
                            text: "Omelette with Rice",
                          ),
                          Expanded(child: Container()),
                          Text(
                            r"$3.00",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            // blurRadius: 5,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SmallText(
                            text: "Coupon",
                          ),
                          Expanded(child: Container()),
                          SmallText(
                            text: "Not available",
                            color: AppColors.darkGreen,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.darkGreen,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                          SmallText(
                            text: "Delivery fee",
                          ),
                          Expanded(child: Container()),
                          Text(
                            r"$0.00",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                          SmallText(
                            text: "Total amount",
                          ),
                          Expanded(child: Container()),
                          Text(
                            r"$3.00",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
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
                                fontSize: 12, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Remarks"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Any requirment",
                      style: TextStyle(fontWeight: FontWeight.w100),
                    )
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'Any requirments',
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        // bottomRight: Radius.circular(10),
                        // topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r"$3.00",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 70,
                    width: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(10),
                          // bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Colors.redAccent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "To Pay",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

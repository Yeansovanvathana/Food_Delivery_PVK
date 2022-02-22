import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';

import '../widgets/big_text.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: BigText(
              text: "LOGIN",
              color: AppColors.darkGreen,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.lightGray))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Your Name ",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.lightGray))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

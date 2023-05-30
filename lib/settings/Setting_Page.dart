import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

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
                  child: Container(
                    width: height / 32.83,
                    height: height / 32.83,
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
                  width: height / 32.83,
                ),
                Column(
                  children: [
                    BigText(
                      text: "Setting",
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: height / 19.7),
              child: Row(
                children: [
                  SmallText(
                    text: "Language",
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkGreen,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height / 49.25),
              child: Row(
                children: [
                  SmallText(
                    text: "Notification Setting",
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkGreen,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height / 19.7),
              child: Row(
                children: [
                  SmallText(
                    text: "Feedback",
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkGreen,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: height / 49.25),
              child: Row(
                children: [
                  SmallText(
                    text: "Help Center",
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkGreen,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

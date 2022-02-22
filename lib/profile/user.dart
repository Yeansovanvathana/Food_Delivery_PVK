import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pvk_food_order_app/profile/account_profile.dart';
import 'package:pvk_food_order_app/utils/color.dart';

import '../widgets/small_text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
              child: Stack(children: [
            AccountProfile(),
            Positioned(
                top: height * 0.4,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Language",
                        ),
                        SizedBox(
                          width: width * 0.646,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkGreen,
                        )
                      ]),
                )),
            Positioned(
                top: height * 0.45,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Notification Setting",
                        ),
                        SizedBox(
                          width: width * 0.48,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkGreen,
                        )
                      ]),
                )),
            Positioned(
                top: height * 0.52,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Feedback",
                        ),
                        SizedBox(
                          width: width * 0.65,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkGreen,
                        )
                      ]),
                )),
            Positioned(
                top: height * 0.57,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Help Center",
                        ),
                        SizedBox(
                          width: width * 0.61,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkGreen,
                        )
                      ]),
                )),
            Positioned(
              top: height * 0.62,
              child: Container(
                child: SmallText(
                  text: "Logout",
                  color: Colors.red,
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}

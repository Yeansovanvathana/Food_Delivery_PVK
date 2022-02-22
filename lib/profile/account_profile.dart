import 'package:flutter/material.dart';

import '../utils/color.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Positioned(
          top: height * 0.1,
          left: width * 0.10,
          right: 0,
          child: Center(
            child: Container(
              width: width * 0.6,
              height: height * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "User 1",
                    style: TextStyle(fontSize: 22),
                  ),
                  Container(
                    width: 160,
                    height: 2,
                    decoration: BoxDecoration(color: AppColors.darkGreen),
                  ),
                  Text(
                    "+855 12345678",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              )),
            ),
          )),
      Positioned(
          top: height * 0.14,
          left: 0,
          right: width * 0.51,
          child: Center(
              child: Container(
            height: height * 0.1,
            width: width * 0.2,
            child: CircleAvatar(
              backgroundColor: AppColors.darkGreen,
              radius: 60.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/acc.png'),
                radius: 40.0,
              ),
            ),
          ))),
    ]);
  }
}

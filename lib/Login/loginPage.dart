import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';

import 'header.dart';
import 'inputWrapper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}

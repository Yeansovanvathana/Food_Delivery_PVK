import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkGreen,
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(children: [
            Column(
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.w300),
                ),
                Text("VKirirom Resort !",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.w300))
              ],
            ),
            SizedBox(height: height * 0.07),
            Container(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
              height: height * 0.752,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: BigText(
                        text: "LOGIN",
                        color: AppColors.darkGreen,
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      // ),
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

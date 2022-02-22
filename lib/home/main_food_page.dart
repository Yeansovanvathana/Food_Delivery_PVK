import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/home/body_food_page.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // showing the header
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: "VKirirom Pine Resort"),
                          Row(
                            children: [
                              SmallText(text: "Luxery Tent ~ Nº20", color: Colors.grey[700], size: 15,),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.darkGreen,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const BodyFoodPage(),
            ],
          ),
        ),
      ),
    );
  }
}

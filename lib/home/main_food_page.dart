import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/home/body_food_page.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  final Function(List<String>) addToCart;

  const MainFoodPage({Key? key, required this.addToCart}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState(addToCart);
}

class _MainFoodPageState extends State<MainFoodPage> {
  final Function(List<String>) addToCart;

  _MainFoodPageState(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // showing the header
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "Pine View Kitchen", color: AppColors.darkGreen,),
                        Row(
                          children: const [
                            Text(
                              "Enjoy Your Meal",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.restaurant, size: 20, color: AppColors.darkGreen,)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: const Icon(
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
              BodyFoodPage(addToCart: addToCart),
            ],
          ),
        ),
      ),
    );
  }
}

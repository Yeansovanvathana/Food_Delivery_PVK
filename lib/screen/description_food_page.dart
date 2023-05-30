import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';
import 'package:pvk_food_order_app/widgets/big_text_center.dart';

import '../widgets/app_icons.dart';
import '../widgets/icon_and_text.dart';
import '../widgets/small_text.dart';

class descriptionFoodPage extends StatefulWidget {
  final Map<String, dynamic> food;
  final Function addToCart;
  const descriptionFoodPage({
    Key? key,
    required this.food,
    required this.addToCart,
  }) : super(key: key);

  @override
  _descriptionFoodPageState createState() =>
      _descriptionFoodPageState(addToCart);
}

class _descriptionFoodPageState extends State<descriptionFoodPage> {
  final Function addToCart;

  _descriptionFoodPageState(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: FutureBuilder(
        future: Firestore()
            .getDetailFood(widget.food["food_type"], widget.food["id"]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Text("Data error");
          }
          var data = snapshot.data as Map<String, dynamic>;
          if (data.isNotEmpty) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 45),
                  width: double.maxFinite,
                  height: 170,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppIcon(
                            icon: Icons.arrow_back_ios,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Column(
                      children: [
                        BigTextCenter(
                          text: data['food_name'],
                          size: 28,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          data["food_description"],
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(fontSize: 16, letterSpacing: 1.5),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SmallText(text: "\$ ${data["price"].toString()}", size: 16, color: Colors.red,),
                            const SizedBox(
                              width: 20,
                            ),
                            const IconAndText(
                                icon: Icons.alarm,
                                text: "15min",
                                iconColor: AppColors.darkGreen),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const IconAndText(
                                  icon: Icons.shopping_cart_outlined,
                                  text: "Add +",
                                  iconColor: Colors.white,
                                  textColor: Colors.white,
                                ),
                              ),
                              onTap: () {
                                addToCart([data['food_name'], data["price"].toString()]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added To Cart!'),
                                    duration: Duration(milliseconds: 500),
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 7, 109),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  width: double.maxFinite,
                  height: 240,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data["image_url"])),
                ),
              ],
            );
          }
          return const Text("No data");
        },
      ),
    );
  }
}

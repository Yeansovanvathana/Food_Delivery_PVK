import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/data/food_type.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';

import '../widgets/app_icons.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_and_text.dart';

class descriptionFoodPage extends StatefulWidget {
  final Map<String, dynamic> food;
  const descriptionFoodPage({Key? key,required this.food}) : super(key: key);

  @override
  _descriptionFoodPageState createState() => _descriptionFoodPageState();
}

class _descriptionFoodPageState extends State<descriptionFoodPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: FutureBuilder(
        future: Firestore().getDetailFood(widget.food["food_type"], widget.food["id"]),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if(snapshot.hasError) {
            return Text("Data error");
          }
          var data = snapshot.data as Map<String, dynamic>;
          print(data);
          if(data.isNotEmpty) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 45),
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
                  margin: EdgeInsets.only(top:200),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Container(
                    margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BigText(text: data['food_name'] , size: 28,),
                            Text("\$${data["price"].toString()}",
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25,),
                        Text(data["food_description"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.5
                          ),
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconAndText(
                                icon: Icons.star,
                                text: "4.5",
                                iconColor: AppColors.darkGreen),
                            SizedBox(
                              width: 20,
                            ),
                            IconAndText(
                                icon: Icons.alarm,
                                text: "15min",
                                iconColor: AppColors.darkGreen),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.darkGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconAndText(
                                icon: Icons.shopping_cart_outlined,
                                text: "Add +",
                                iconColor: Colors.white,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  width: double.maxFinite,
                  height: 240,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data["image_url"])
                  ),
                ),
              ],
            );
          }
          return Text("No data");
        },
      ),
    );
  }
}

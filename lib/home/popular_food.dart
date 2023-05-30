import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

import '../screen/description_food_page.dart';

class PopularFoodCard extends StatefulWidget {
  final Function(List<String>) addToCart;
  const PopularFoodCard({Key? key, required this.addToCart}) : super(key: key);

  @override
  _PopularFoodCardState createState() => _PopularFoodCardState(addToCart);
}

class _PopularFoodCardState extends State<PopularFoodCard> {
  final Function(List<String>) addToCart;

  _PopularFoodCardState(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore().getPopularFood(),
      builder: (context, snapshot) {
        // print(snapshot.data);

        if (snapshot.hasData) {
          var food = snapshot.data as List<Map<String, dynamic>>;
          return Column(
            children: food.map((data) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => descriptionFoodPage(food: data, addToCart: addToCart)),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: Image.network(
                          data['image_url'],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: data['food_name'],
                                size: 15,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '\$${data['prices'].toString()}',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Spacer(),
                      ButtonTheme(
                        height: 30,
                        minWidth: 60,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                  color: AppColors.darkGreen, width: 2)),
                          color: Colors.white,
                          child: const Text(
                            "Add+",
                            style: TextStyle(
                                color: AppColors.darkGreen, fontSize: 12),
                          ),
                          onPressed: () {
                            addToCart([data['food_name'], data['prices'].toString()]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
        return Text("getting the data");
      },
    );
  }
}

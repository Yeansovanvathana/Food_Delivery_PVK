import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/home/popular_food.dart';
import 'package:pvk_food_order_app/screen/detail_food_page.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/icon_and_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BodyFoodPage extends StatefulWidget {
  final Function(List<String>) addToCart;

  const BodyFoodPage({Key? key, required this.addToCart}) : super(key: key);

  @override
  _BodyFoodPageState createState() => _BodyFoodPageState(addToCart);
}

class _BodyFoodPageState extends State<BodyFoodPage> {
  PageController pageController = PageController();
  var _currPageValue = 0.0;
  final Function(List<String>) addToCart;

  _BodyFoodPageState(this.addToCart);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          child: FutureBuilder(
            future: Firestore().getAllFood(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data as List<Map<String, dynamic>>;
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // Map<String, dynamic> food = food_type[index];
                          return BuildPageItem(data[index]);
                        },
                        onPageChanged: (page) {
                          setState(() {
                            _currPageValue = page + .0;
                          });
                        },
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: data.length,
                      position: _currPageValue,
                      decorator: DotsDecorator(
                        activeColor: AppColors.darkGreen,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                );
              }
              return Text("no data");
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            children: [
              BigText(text: "Popular Now"),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        PopularFoodCard(addToCart: addToCart),
      ],
    );
  }

  Widget BuildPageItem(Map<String, dynamic> food) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailFoodPage(food: food, addToCart: addToCart)),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.darkGreen,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(food['image_url']))),
          ),
          Positioned(
            bottom: 20,
            left: 40,
            right: 40,
            child: Container(
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.only(left: 60, right: 60, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 5))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(text: food['food_type_name']),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          text: "Available",
                          iconColor: AppColors.darkGreen),
                      SizedBox(
                        width: 20,
                      ),
                      IconAndText(
                          icon: Icons.motorcycle_rounded,
                          text: "Free",
                          iconColor: AppColors.darkGreen),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/screen/description_food_page.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';
import 'package:pvk_food_order_app/widgets/app_icons.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/icon_and_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

class DetailFoodPage extends StatefulWidget {
  final Map<String, dynamic> food;
  final Function addToCart;

  const DetailFoodPage({
    Key? key,
    required this.food,
    required this.addToCart,
  }) : super(key: key);

  @override
  _DetailFoodPageState createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  String typeOfScreen = ''; // can be either 'khmer-food', 'western-food',
  // 'indian-food', 'juice-drink', 'alcohol-drink', 'dessert-drink
  _indentifyTypeOfScreen() {
    var type = widget.food['food_type_name'];
    if (type == 'Khmer Food') {
      setState(() {
        typeOfScreen = 'khmerFoods';
      });
    } else if (type == 'Western Food') {
      setState(() {
        typeOfScreen = 'western-food';
      });
    } else if (type == 'Indian Food') {
      setState(() {
        typeOfScreen = 'indian-food';
      });
    } else if (type == 'Juice Drink') {
      setState(() {
        typeOfScreen = 'juice-food';
      });
    } else if (type == 'Alcohol Drink') {
      setState(() {
        typeOfScreen = 'alcohol-food';
      });
    } else if (type == 'Dessert') {
      setState(() {
        typeOfScreen = 'dessert-food';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _indentifyTypeOfScreen();
  }

  @override
  Widget build(BuildContext context) {
    print(typeOfScreen);
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      // child: Text(widget.food['food_type_name']),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 45),
            width: double.maxFinite,
            height: 170,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const AppIcon(icon: Icons.shopping_cart_outlined),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BigText(
                    text: widget.food['food_type_name'],
                    color: Colors.white,
                    size: 30)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 170),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: FutureBuilder(
              future: Firestore().getEachFoodType(typeOfScreen),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return const Text("Data error");
                }

                var data = snapshot.data as List<Map<String, dynamic>>;
                if (data.isNotEmpty) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return BuildPageItem(data[index]);
                    },
                  );
                }
                return const Text("no data");
              },
            ),
            // child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //       return BuildPageItem(index);
            //     }),
          )
        ],
      ),
    );
  }

  Widget BuildPageItem(Map<String, dynamic> data) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    descriptionFoodPage(food: data, addToCart: widget.addToCart)));
      },
      child: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 240,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.darkGreen,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(data["image_url"]))),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              // height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 5))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: data["food_name"], size: 18,),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(text: "\$ ${data["prices"].toString()}", size: 16, color: Colors.red,),
                        const SizedBox(
                          width: 20,
                        ),
                        const IconAndText(
                            icon: Icons.alarm,
                            text: "15min",
                            iconColor: AppColors.darkGreen ),
                        const SizedBox(
                          width: 20,
                        ),
                        const IconAndText(
                            icon: Icons.motorcycle_rounded,
                            text: "Free",
                            iconColor: AppColors.darkGreen),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

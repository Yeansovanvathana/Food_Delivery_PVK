import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/color.dart';
import '../widgets/big_text.dart';
import 'item_in_cart.dart';

class HasItem extends StatefulWidget {
  final Function(List<String>) addToCart;
  final Function navigateTo;
  final Function removeFromCart;
  const HasItem({
    Key? key,
    required this.addToCart,
    required this.navigateTo,
    required this.removeFromCart,
  }) : super(key: key);

  @override
  HasItemState createState() =>
      HasItemState(addToCart, navigateTo, removeFromCart);
}

class HasItemState extends State<HasItem> {
  final Function(List<String>) addToCart;
  final Function navigateTo;
  final Function removeFromCart;
  double sum = 0;
  Map<String, dynamic> items = {};

  HasItemState(
    this.addToCart,
    this.navigateTo,
    this.removeFromCart,
  );

  @override
  void initState() {
    super.initState();

    prepareItems();
  }

  prepareItems() async {
    await getItems("itemnames").then((name) async {
      for (final itn in items.keys) {
        items[itn] = [];
      }
      if (name != null && name.isNotEmpty) {
        for (final itemname in name) {
          items[itemname] = [];
        }
        await getItems("items").then(
          (value) => {
            if (value != null && value.isNotEmpty)
              {
                for (var i = 0; i < value.length; i += 2)
                  {
                    items[value[i]].add(double.parse(value[i + 1])),
                  },
              },
          },
        );
      }
      displayItems();
    });
  }

  displayItems() {
    setState(() {
      sum = 0;
      for (final item in items.entries) {
        if (item.value.length > 0) {
          sum = sum + (item.value.reduce((a, b) => a + b) as double);
        } else {
          sum += 0;
        }
      }
    });
    // if (sum == 0) {
    //   navigateTo("emptycart");
    // }
  }

  Future<List<String>?> getItems(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getStringList(key);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: height / 32.83,
              left: height / 49.25,
              right: height / 49.25,
              bottom: height / 32.83),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                      child: InkWell(
                        child: Container(
                          width: height / 32.83,
                          height: height / 32.83,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height / 98.5),
                            color: AppColors.darkGreen,
                          ),
                        ),
                        onTap: () {
                          navigateTo("homepage");
                        },
                      ),
                    ),
                    SizedBox(
                      width: height / 21.88,
                    ),
                    BigText(
                      text: "Cart",
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: height / 49.25,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  padding: EdgeInsets.symmetric(
                      vertical: height / 32.83, horizontal: height / 49.25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...items.entries.map((e) {
                        return ItemInCart(
                            item: [
                              e.key,
                              e.value.length,
                              e.value.length > 0 ? e.value[0] : 0
                            ],
                            addToCart: addToCart,
                            removeFromCart: removeFromCart,
                            prepareItems: prepareItems);
                      }),
                      SizedBox(
                        height: height / 19.7,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Delivery Fee",
                          ),
                          Expanded(child: Container()),
                          const Text(
                            '\$0.00',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 49.25,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Total",
                          ),
                          Expanded(child: Container()),
                          Text(
                            '\$$sum',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: height / 32.83),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(height / 98.5),
                          width: height / 3,
                          height: height / 20,
                          decoration: BoxDecoration(
                            color: sum == 0
                                ? Color.fromARGB(255, 73, 73, 73)
                                : AppColors.darkGreen,
                            borderRadius: BorderRadius.circular(height / 32.83),
                          ),
                          child: Text(
                            "Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height / 55, color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          sum == 0
                              ? navigateTo("homepage")
                              : navigateTo("confirmOrder");
                        },
                      ),
                    ],
                    //ItemInCart(item: [items[0], items[1]]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

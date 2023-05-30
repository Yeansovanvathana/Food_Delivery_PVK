import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/cart/has_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cart/empty.dart';

class orderPage extends StatefulWidget {
  final Function(List<String>) addToCart;
  final Function navigateTo;
  final Function removeFromCart;
  final int itemNumber;

  const orderPage({
    Key? key,
    required this.addToCart,
    required this.navigateTo,
    required this.removeFromCart,
    required this.itemNumber,
  }) : super(key: key);

  @override
  _orderPageState createState() =>
      _orderPageState(addToCart, navigateTo, removeFromCart, itemNumber);
}

class _orderPageState extends State<orderPage> {
  final Function(List<String>) addToCart;
  final Function navigateTo;
  final Function removeFromCart;
  int itemNumber;

  _orderPageState(
      this.addToCart, this.navigateTo, this.removeFromCart, this.itemNumber);

  bool hasItem = false;

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>?> getItems(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getStringList(key);
  }

  @override
  Widget build(BuildContext context) {
    return itemNumber > 0
        ? HasItem(
            addToCart: addToCart,
            removeFromCart: removeFromCart,
            navigateTo: navigateTo,)
        : Empty(navigateTo: navigateTo);
  }
}

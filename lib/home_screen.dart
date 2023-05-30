import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/pages/chat_page.dart';
import 'package:pvk_food_order_app/pages/favorite_page.dart';
import 'package:pvk_food_order_app/pages/order_page.dart';
import 'package:pvk_food_order_app/pages/profile_page.dart';
import 'package:pvk_food_order_app/utils/main_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Confirm_order_page/Confrim_order.dart';
import 'home/main_food_page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String currentPage = "homePage";
  int itemNumber = 0;

  @override
  void initState() {
    super.initState();
    // resetItems().then(((value) {
    //   getItem("items").then((value) => {
    //         itemNumber = value!.length,
    //         navigationTo("homepage"),
    //       });
    // }));
    getItem("items").then((value) => {
          itemNumber = value == null ? 0 : (value.length ~/ 2),
          navigationTo("homepage"),
        });
    resetInfo();
  }

  navigationTo(String page) async {
    await getItem("items").then((value) => {
          itemNumber = value == null ? 0 : (value.length ~/ 2),
        });

    //resetInfo();

    setState(() {
      currentPage = page;

      if (page == "emptycart") {
        currentPage = "orderPage";
      }
    });
  }

  Future addToCart(List<dynamic> item) async {
    setState(() {
      itemNumber += 1;
    });

    await getItem("items").then((value) async {
      if (value != null && value.isNotEmpty) {
        value.add(item[0]);
        value.add(item[1]);
      } else {
        value = [item[0], item[1]];
      }
      await addItem(value);
    });

    await getItem("itemnames").then((names) async {
      if (names != null && names.isNotEmpty) {
        if (!names.contains(item[0])) {
          names.add(item[0]);
        }
      } else {
        names = [item[0]];
      }
      await addItemName(names);
    });

    return "addToCart";
  }

  Future removeFromCart(List<dynamic> item) async {
    setState(() {
      itemNumber -= 1;
    });
    return await removeItem(item);
  }

  Future<void> addItem(List<dynamic>? items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("items", items! as List<String>);
  }

  Future<void> addItemName(List<String> itemNames) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("itemnames", itemNames);
  }

  Future removeItem(List<dynamic> item) async {
    await getItem("items").then(
      (value) async {
        for (var i = 0; i < value!.length; i += 1) {
          if (value[i] == item[0]) {
            value.removeAt(i + 1);
            value.removeAt(i);
            break;
          }
        }
        if (!value.contains(item[0])) {
          getItem("itemnames").then((names) async {
            names!.remove(item[0]);
            await addItemName(names);
          });
        }
        await addItem(value);
      },
    );
    return "removeItem";
  }

  Future<List<String>?> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<void> resetItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('items');
    await prefs.remove('itemnames');
  }

  resetInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("borey", "");
    await prefs.setString("room", "");
    await prefs.setString("payment", "");
    await prefs.setString("name", "");
    await prefs.setString("phone", "");
  }

  Map<String, Widget> pageSelector = {
    "favoritePage": const favoritePage(),
    "chatPage": const chatPage(),
    "profilePage": const profilePage()
  };
  @override
  Widget build(BuildContext context) {
    return currentPage == "confirmOrder"
        ? ConfirmOrder(navigateTo: navigationTo)
        : currentPage == "orderPage"
            ? orderPage(
                addToCart: addToCart,
                removeFromCart: removeFromCart,
                navigateTo: navigationTo,
                itemNumber: itemNumber)
            : Scaffold(
                bottomNavigationBar: MainNavbar(
                    currentPage: currentPage,
                    navigateTo: navigationTo,
                    cartBadge: itemNumber),
                body: SafeArea(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInToLinear,
                    switchOutCurve: Curves.easeInToLinear,
                    child: pageSelector[currentPage] ??
                        MainFoodPage(
                          addToCart: addToCart,
                        ),
                  ),
                ),
              );
  }
}

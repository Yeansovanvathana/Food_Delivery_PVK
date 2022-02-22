import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/pages/chat_page.dart';
import 'package:pvk_food_order_app/pages/favorite_page.dart';
import 'package:pvk_food_order_app/pages/order_page.dart';
import 'package:pvk_food_order_app/pages/profile_page.dart';
import 'package:pvk_food_order_app/utils/main_nav_bar.dart';

import 'home/main_food_page.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String currentPage = "homePage";

  navigationTo(String page){
    setState(() {
      currentPage = page;
    });
  }

  Map<String, Widget> pageSelector = {
    "homePage" : const MainFoodPage(),
    "favoritePage" : const favoritePage(),
    "orderPage" : const orderPage(),
    "chatPage" : const chatPage(),
    "profilePage" : const profilePage()
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavbar(currentPage: currentPage, navigateTo: navigationTo),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          switchInCurve: Curves.easeInToLinear,
          switchOutCurve: Curves.easeInToLinear,
          child: pageSelector[currentPage] ??
            const MainFoodPage(),
        ),
      ),
    );
  }
}

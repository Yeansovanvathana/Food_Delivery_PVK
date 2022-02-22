import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/widgets/nav_bar_button.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({Key? key,required this.currentPage, required this.navigateTo}) : super(key: key);
  final String currentPage;
  final Function navigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarButton(pageName: "homePage", icon: Icons.add_to_home_screen_outlined, toolTipText: "Home", currentPage: currentPage, navigateTo: navigateTo),
          NavBarButton(pageName: "favoritePage", icon: Icons.star, toolTipText: "Favorite", currentPage: currentPage, navigateTo: navigateTo),
          NavBarButton(pageName: "orderPage", icon: Icons.shopping_cart_outlined, toolTipText: "Buy", currentPage: currentPage, navigateTo: navigateTo),
          NavBarButton(pageName: "chatPage", icon: Icons.message, toolTipText: "Chat", currentPage: currentPage, navigateTo: navigateTo),
          NavBarButton(pageName: "profilePage", icon: Icons.person, toolTipText: "Profile", currentPage: currentPage, navigateTo: navigateTo)
        ],
      ),
    );
  }
}

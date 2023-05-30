import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/widgets/nav_bar_button.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar(
      {Key? key, required this.currentPage, required this.navigateTo, this.cartBadge = 0})
      : super(key: key);
  final String currentPage;
  final Function navigateTo;
  final int cartBadge;

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
          NavBarButton(
              pageName: "homePage",
              icon: Icons.add_to_home_screen_outlined,
              toolTipText: "Home",
              currentPage: currentPage,
              navigateTo: navigateTo),
          NavBarButton(
              pageName: "favoritePage",
              icon: Icons.star,
              toolTipText: "Favorite",
              currentPage: currentPage,
              navigateTo: navigateTo),
          Badge(
            badgeContent: Text(cartBadge.toString()),
            child: NavBarButton(
                pageName: "orderPage",
                icon: Icons.shopping_cart_outlined,
                toolTipText: "Buy",
                currentPage: currentPage,
                navigateTo: navigateTo),
            showBadge: cartBadge<=0 ? false: true,
          ),
          NavBarButton(
              pageName: "chatPage",
              icon: Icons.message,
              toolTipText: "Summary",
              currentPage: currentPage,
              navigateTo: navigateTo),
          NavBarButton(
              pageName: "profilePage",
              icon: Icons.settings,
              toolTipText: "Setting",
              currentPage: currentPage,
              navigateTo: navigateTo)
        ],
      ),
    );
  }
}

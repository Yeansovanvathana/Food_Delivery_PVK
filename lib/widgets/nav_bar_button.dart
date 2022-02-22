import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({Key? key,
      required this.pageName,
      required this.icon,
      required this.toolTipText,
      required this.currentPage,
      required this.navigateTo
  }) : super(key: key);
  final String pageName;
  final IconData icon ;
  final String toolTipText ;
  final String currentPage ;
  final Function navigateTo ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: (pageName == currentPage)
              ? AppColors.darkGreen : Colors.black.withOpacity(0.6)
          ),
          Text(
            toolTipText,
            style: TextStyle(
              fontSize: 12,
              color: (pageName == currentPage)
                ? AppColors.darkGreen : Colors.black.withOpacity(0.6)
            ),
          )
        ],
      ),
      onTap: () {
        if(currentPage != pageName) navigateTo(pageName);
      },
    );
  }
}

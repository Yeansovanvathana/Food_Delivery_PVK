import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size ;
  final Function()? onTap;

  const AppIcon({Key? key,required this.icon,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.iconColor = const Color(0xff808080),
    this.size = 40,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius:   BorderRadius.circular(30),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 16
        ),
      ),
    );
  }
}

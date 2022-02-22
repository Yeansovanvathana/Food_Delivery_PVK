import 'package:flutter/cupertino.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final double? size;
  final Color? textColor;
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({Key? key, required this.icon,required this.text,required this.iconColor, this.textColor, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        Text(text,
          style: TextStyle(
              color: textColor,
              fontSize: size,
              height: 1.2,
              letterSpacing: 1.1
          ),
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../widgets/small_text.dart';

class Item extends StatelessWidget {
  final List<String> item;
  const Item({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: height / 32.83,
            height: height / 32.83,
            child: Text(
              "${item[1]}x",
              style: TextStyle(fontSize: height / 65.66),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreen,
            ),
          ),
        ),
        SizedBox(width: height / 49.25),
        Expanded(
          flex: 6,
          child: SmallText(
            text: item[0],
          ),
        ),
        Expanded(child: Container()),
        Text(
          "\$${item[2]}",
          style:
              TextStyle(fontSize: height / 54.72, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {Key? key,
      Color this.color = const Color(0xFF000000),
      required this.text,
      this.size = 20,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.1
      ),
    );
  }
}

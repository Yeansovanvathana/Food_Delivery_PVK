import 'package:flutter/material.dart';

import '../History/Order_summary.dart';

class chatPage extends StatefulWidget {

  const chatPage({Key? key}) : super(key: key);

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    return Order_summary();
  }
}

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:pvk_food_order_app/History/order.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';

import '../utils/color.dart';

class Order_summary extends StatefulWidget {
  const Order_summary({Key? key}) : super(key: key);

  @override
  State<Order_summary> createState() => _Order_summaryState();
}

class _Order_summaryState extends State<Order_summary> {
  final db = Localstore.instance;
  Map<String, dynamic> items = {};

  @override
  void initState() {
    super.initState();

    testing();
  }

  testing() async {
    //final id = db.collection('todos').doc().id;
    await db.collection('history').get().then((value) {
      for (var i in value!.keys) {
        items[i] = value[i];
      }
      setState(() {});
    });
    //db.collection('history').doc().delete();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height / 32.83, horizontal: height / 32.83),
            child: Column(children: [
              Center(
                  child: Text(
                "Ordering Summary",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  ...items.keys.map((key) {
                    return Order(height: height, item: items[key]);
                  })
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

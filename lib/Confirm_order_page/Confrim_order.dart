import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:pvk_food_order_app/Confirm_order_page/inputField.dart';
import 'package:pvk_food_order_app/Confirm_order_page/item.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:pvk_food_order_app/widgets/small_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'inputField.dart';
import 'Choose_address.dart';
import 'Payment_method.dart';

class ConfirmOrder extends StatefulWidget {
  final Function navigateTo;

  const ConfirmOrder({Key? key, required this.navigateTo}) : super(key: key);

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final Map<String, dynamic> items = {};
  double totalAmount = 0;
  String address = "Select Address";
  String payment = "Select Payment Method";
  String name = '';
  String phone = "";
  bool payable = false;
  bool clickable = true;

  final db = Localstore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('orders');

  _showModelBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ChooseAddress(refresh: refresh);
        });
  }

  _showModelBottomCase(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return PaymentMethod(refresh: refresh, totalAmount: totalAmount);
        });
  }

  @override
  void initState() {
    super.initState();

    prepareItems();
    prepareInfo();
  }

  prepareItems() async {
    await getItems("itemnames").then((name) async {
      for (final itn in items.keys) {
        items[itn] = [];
      }
      if (name != null && name.isNotEmpty) {
        for (final itemname in name) {
          items[itemname] = [];
        }
        await getItems("items").then(
          (value) => {
            if (value != null && value.isNotEmpty)
              {
                for (var i = 0; i < value.length; i += 2)
                  {
                    items[value[i]].add(double.parse(value[i + 1])),
                    totalAmount += double.parse(value[i + 1]),
                  },
              },
          },
        );
      }
    });
    refresh();
  }

  refresh() {
    setState(() {
      prepareInfo();
    });
  }

  prepareInfo() async {
    address = 'Select Address';
    payment = "Select Payment Method";
    name = "";
    phone = "";
    await getItem("borey").then((value) async {
      if (value != "") {
        address = "";
        address += value as String;
        address += "  ";
        await getItem("room").then((value) {
          if (value != "") {
            address += value as String;
          }
        });
      }
    });
    await getItem("payment").then((value) {
      if (value != "") {
        payment = value as String;
      }
    });
    await getItem("name").then((value) {
      if (value != "") {
        name = value as String;
      }
    });
    await getItem("phone").then((value) {
      if (value != "") {
        phone = value as String;
      }
    });

    print("$name     $phone");
    if (address == 'Select Address' ||
        payment == "Select Payment Method" ||
        name == "" ||
        phone == "") {
      payable = false;
    } else {
      payable = true;
    }
  }

  Future<List<String>?> getItems(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<String?> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> addItems(String key, List<String> item) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, item);
  }

  Future<void> addOrder() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name,
          'phone': phone,
          'address': address,
          'payment': payment,
          'items': items
        })
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  snackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 1200),
        backgroundColor: Color.fromARGB(255, 218, 0, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // print("Screen" + MediaQuery.of(context).size.width.toString());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGreen,
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: height / 32.83, horizontal: height / 49.25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Center(
                        child: Container(
                          width: height / 32.83,
                          height: height / 32.83,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.navigateTo("orderPage");
                      },
                    ),
                    SizedBox(
                      width: height / 21.88,
                    ),
                    Column(
                      children: [
                        BigText(
                          text: "Confirm Order",
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height / 24.625,
                ),
                InputField(),
                SizedBox(height: height / 49.25),
                RawMaterialButton(
                  onPressed: () {
                    _showModelBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height / 21.88,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          )
                        ]),
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.pin_drop_rounded,
                                color: AppColors.darkGreen,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightGreen,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          SmallText(
                            text: address,
                            color: AppColors.darkGreen,
                          ),
                          SizedBox(width: height / 49.25),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.darkGreen,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    _showModelBottomCase(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height / 19.7,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          )
                        ]),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: height / 49.25),
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.attach_money,
                                color: AppColors.darkGreen,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightGreen,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          SmallText(
                            text: payment,
                            color: AppColors.darkGreen,
                          ),
                          SizedBox(width: height / 49.25),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.darkGreen,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 49.25),
                //Food order cotainer
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(height / 49.25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Food order",
                        ),
                        SizedBox(height: height / 39.4),
                        //item already order
                        ...items.entries.map((item) {
                          return Item(item: [
                            item.key,
                            item.value.length.toString(),
                            item.value.length > 0
                                ? item.value[0].toString()
                                : "0"
                          ]);
                        }),
                        SizedBox(height: height / 65.66),
                        Container(
                          padding: EdgeInsets.only(top: height / 49.25),
                          width: double.infinity,
                          height: 1,
                          decoration:
                              const BoxDecoration(color: AppColors.darkGreen),
                        ),
                        //Delivery fee
                        Container(
                          padding: EdgeInsets.only(top: height / 32.83),
                          child: Row(
                            children: [
                              SmallText(
                                text: "Delivery fee",
                              ),
                              Expanded(child: Container()),
                              Text(
                                r"$0.00",
                                style: TextStyle(
                                    fontSize: height / 54.72,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: height / 98.5),
                          child: Row(
                            children: [
                              SmallText(
                                text: "Total amount",
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\$$totalAmount",
                                style: TextStyle(
                                    fontSize: height / 54.72,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            children: [
                              SmallText(
                                text: "Exchange rate",
                              ),
                              Expanded(child: Container()),
                              Text(
                                r"$1=4100 Riel",
                                style: TextStyle(
                                    fontSize: height / 65.66,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Button Pay
                Container(
                  height: height / 14.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(height / 19.7),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: height / 14.07,
                        width: width / 2.193,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(height / 19.7),
                            bottomLeft: Radius.circular(height / 19.7),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$$totalAmount",
                              style: TextStyle(
                                  fontSize: height / 49.25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: height / 14.07,
                        width: width / 2.193,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(height / 19.7),
                              topRight: Radius.circular(height / 19.7),
                            ),
                            color: Colors.redAccent),
                        child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "To Pay",
                                  style: TextStyle(
                                      fontSize: height / 49.25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            onTap: clickable
                                ? () async {
                                    await prepareInfo();
                                    setState(() {
                                      clickable = false;
                                    });
                                    payable
                                        ? {
                                            addOrder().then((value) async {
                                              await addItems("items", []);
                                              await addItems("itemnames", []);

                                              final id = db
                                                  .collection('history')
                                                  .doc()
                                                  .id;
                                              db
                                                  .collection('history')
                                                  .doc(id)
                                                  .set({
                                                'name': name,
                                                'phone': phone,
                                                'address': address,
                                                'order': items,
                                                'total': totalAmount,
                                              });
                                              widget.navigateTo("homePage");
                                            }).catchError((onError) {
                                              snackbar(
                                                  "Can Not Place The Order!\nPleas try again!");
                                              setState(() {
                                                clickable = true;
                                              });
                                            })
                                          }
                                        : {
                                            snackbar("Not Enough Information!"),
                                            setState(() {
                                              clickable = true;
                                            }),
                                          };
                                  }
                                : () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}

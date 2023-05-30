import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  String name = '';
  String phone = '';
  int counter = 0;

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  Future prepareNamePhone() async {
    await getItem("name").then((value) {
      name = value as String;
    });
    await getItem("phone").then((value) {
      phone = value as String;
    });
  }

  @override
  void initState() {
    super.initState();

    prepareNamePhone().then((value) {
      setState(() {
        nameController.text = name;
        phoneController.text = phone;
      });
    });
  }

  Future<void> addItem(String key, String item) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, item);
  }

  Future<String?> getItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD inptut field   name:$name   phone:$phone");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: height / 197),
      height: height / 6.56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: width / 1.008,
            height: height / 14.07,
            padding: EdgeInsets.all(height / 98.5),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.lightGreen))),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                prefixIconColor: AppColors.darkGreen,
                hintText: "Your Name ",
                hintStyle: TextStyle(color: AppColors.darkGreen),
                border: InputBorder.none,
              ),
              controller: nameController,
              onChanged: (text) async {
                await addItem("name", text);
              },
            ),
          ),
          Container(
            width: width / 1.008,
            height: height / 14.07,
            padding: EdgeInsets.all(height / 98.5),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.lightGreen))),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  prefixIconColor: AppColors.darkGreen,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: AppColors.darkGreen),
                  border: InputBorder.none),
              onChanged: (phone) async {
                await addItem("phone", phone);
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: phoneController,
            ),
          ),
        ],
      ),
    );
  }
}

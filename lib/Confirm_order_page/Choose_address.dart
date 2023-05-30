import 'package:flutter/material.dart';
import 'package:pvk_food_order_app/utils/color.dart';
import 'package:pvk_food_order_app/utils/firestore.dart';
import 'package:pvk_food_order_app/widgets/big_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseAddress extends StatefulWidget {
  final Function refresh;
  const ChooseAddress({Key? key, required this.refresh}) : super(key: key);

  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  Future roomData = Firestore().getRoomType();

  int _selectedMainLocationIndex = -1;
  int _selectedRoomLocationIndex = -1;
  String borey = '';
  String broom = '';

  Future<void> addItem(String key, String item) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, item);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(height / 24.625),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(height / 19.7),
          topRight: Radius.circular(height / 19.7),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              BigText(text: "Choose address"),
              const Spacer(),
              InkWell(
                onTap: () async {
                  _selectedMainLocationIndex != -1 &&
                          _selectedRoomLocationIndex != -1
                      ? {
                          await addItem("borey", borey),
                          await addItem("room", broom),
                          await widget.refresh(),
                          Navigator.pop(context),
                        }
                      : setState(() {
                          _selectedMainLocationIndex = -1;
                          _selectedRoomLocationIndex = -1;
                          borey = '';
                          broom = '';
                        });
                  print("$borey  $broom");
                },
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                ),
              )
            ],
          ),
          SizedBox(height: height / 21.88),
          Expanded(
            child: Container(
              // padding: const EdgeInsets.only(top: 10),
              // margin: const EdgeInsets.only(left: 30, right: 30),
              child: FutureBuilder(
                future: roomData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return const Text("Loading...");
                  }
                  var data = snapshot.data as List<Map<String, dynamic>>;
                  // var data = snapshot.data as Map<String, dynamic>;
                  if (data.isNotEmpty) {
                    var rooms = data[_selectedMainLocationIndex != -1
                        ? _selectedMainLocationIndex
                        : 0]['ListRoomNum'];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                //borey = data[index]["name"];
                                final isSelected =
                                    _selectedMainLocationIndex == index;
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedMainLocationIndex = index;
                                      _selectedRoomLocationIndex = -1;
                                    });
                                    borey = data[index]["name"];
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected ? Colors.grey : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 20,
                                    child: Text(
                                      data[index]["name"],
                                      textAlign: TextAlign.center,
                                    ),
                                    // child: Text(data["ListRoomNum"][index], textAlign: TextAlign.center,),
                                    // color: Colors.blue,
                                    margin: const EdgeInsets.only(bottom: 20),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              var room = rooms[index];
                              //broom = room;
                              var isSelected =
                                  _selectedRoomLocationIndex == index;

                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedRoomLocationIndex = index;
                                  });
                                  broom = rooms[index];
                                },
                                child: Container(
                                  child: Text(room),
                                  decoration: BoxDecoration(
                                    color: isSelected ? Colors.grey : null,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("No data");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

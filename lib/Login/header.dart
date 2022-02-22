import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(children: [
              Text(
                "Welcome to",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.w300),
              ),
              Text("VKirirom Resort !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.w300))
            ]),
            // child: Text(
            //   "Welcome to Vkirirom Resort",
            //   style: TextStyle(color: Colors.white, fontSize: 40),
            // ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

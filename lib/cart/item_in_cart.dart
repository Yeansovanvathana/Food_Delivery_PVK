import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class ItemInCart extends StatefulWidget {
  final List<dynamic> item;
  final Function addToCart;
  final Function removeFromCart;
  final Function prepareItems;

  ItemInCart({
    required this.item,
    required this.addToCart,
    required this.removeFromCart,
    required this.prepareItems,
  });

  @override
  ItemInCartState createState() => ItemInCartState(
        item: item,
        addToCart: addToCart,
        removeFromCart: removeFromCart,
        prepareItems: prepareItems,
      );
}

class ItemInCartState extends State<ItemInCart> {
  final List<dynamic> item;
  final Function addToCart;
  final Function removeFromCart;
  final Function prepareItems;
  ItemInCartState({
    Key? key,
    required this.item,
    required this.addToCart,
    required this.removeFromCart,
    required this.prepareItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            item[0],
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 3,
          child: SpinBox(
            value: item[1].toDouble(),
            readOnly: true,
            onChanged: (value) async {
              if (value < item[1]) {
                await removeFromCart([item[0], item[2].toString()])
                    .then((_) => {
                          prepareItems(),
                        });
                item[1] -= 1;
              } else {
                await addToCart([item[0], item[2].toString()]).then((_) => {
                      prepareItems(),
                    });
                item[1] += 1;
              }
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${item[2]} \$',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

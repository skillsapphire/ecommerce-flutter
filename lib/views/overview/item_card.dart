import 'package:flutter/material.dart';
import 'package:listing_app/constants/ui_constants.dart';
import 'package:listing_app/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function press;
  const ItemCard({
    Key key,
    this.item,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${item.id}",
                //child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              item.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "${item.content}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/item_model.dart';

class ProductScreen extends StatelessWidget {
  final ItemModel item;
  const ProductScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(children: [
        Expanded(
          child: Image.asset(item.imgUrl),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                50,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.itemName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30,
                width: 70,
              )
            ],
          ),
        ))
      ]),
    );
  }
}

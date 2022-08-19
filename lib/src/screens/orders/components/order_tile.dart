import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/models/order_model.dart';
import 'package:flutter_ecommerce/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final UtilsServices utilsServices = UtilsServices();
  final OrderModel order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          children: [],
        ),
      ),
    );
  }
}

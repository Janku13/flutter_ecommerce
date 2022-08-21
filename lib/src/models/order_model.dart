// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_ecommerce/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  String status;
  String copyAndPaste;
  double total;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.copyAndPaste,
    required this.total,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
  });
}

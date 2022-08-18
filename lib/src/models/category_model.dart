// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_ecommerce/src/models/item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;

  @JsonKey(defaultValue: 0)
  int pagination;

  @JsonKey(defaultValue: [])
  List<ItemModel> items;
  CategoryModel({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() => 'CategoryModel(title: $title, id: $id)';
}

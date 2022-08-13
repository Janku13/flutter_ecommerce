import 'package:flutter_ecommerce/src/models/category_model.dart';
import 'package:flutter_ecommerce/src/models/item_model.dart';
import 'package:flutter_ecommerce/src/screens/home/result/home_result.dart';
import 'package:flutter_ecommerce/src/services/api/api_constants.dart';
import 'package:flutter_ecommerce/src/services/api/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
  Future<HomeResult<ItemModel>> getAllProducts(
    Map<String, dynamic> body,
  ) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllProducts,
      method: HttpMethods.POST,
      body: body,
    );
    if (result['result'] != null) {
      List<ItemModel> data = List<Map<String, dynamic>>.from(result['result'])
          .map(ItemModel.fromJson)
          .toList();
      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult<ItemModel>.error('Error com produtos');
    }
  }

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.POST,
    );

    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();
      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error('error nas categorias');
    }
  }
}

import 'package:flutter_ecommerce/src/models/category_model.dart';
import 'package:flutter_ecommerce/src/screens/home/result/home_result.dart';
import 'package:flutter_ecommerce/src/services/api/api_constants.dart';
import 'package:flutter_ecommerce/src/services/api/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
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
      return HomeResult.success(data);
    } else {
      return HomeResult.error('error nas categorias');
    }
  }
}

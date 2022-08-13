import 'package:flutter_ecommerce/src/models/category_model.dart';
import 'package:flutter_ecommerce/src/models/item_model.dart';
import 'package:flutter_ecommerce/src/screens/home/repository/home_repository.dart';
import 'package:flutter_ecommerce/src/screens/home/result/home_result.dart';
import 'package:flutter_ecommerce/src/services/utils_services.dart';
import 'package:get/get.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();
  List<ItemModel> get allProducts => currentCategory?.items ?? [];
  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
    if (currentCategory!.items.isNotEmpty) return;
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemsPerPage,
    };
    setLoading(true, isProduct: true);
    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);
    setLoading(false, isProduct: true);
    result.when(success: (data) {
      currentCategory!.items = data;
    }, error: (msg) {
      utilsServices.showToast(message: msg, isError: true);
    });
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();
    setLoading(false);
    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);
        if (allCategories.isEmpty) return;
        selectCategory(allCategories.first);
      },
      error: (msg) {
        utilsServices.showToast(
          message: msg,
          isError: true,
        );
      },
    );
  }
}

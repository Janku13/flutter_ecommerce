import 'package:flutter_ecommerce/src/models/category_model.dart';
import 'package:flutter_ecommerce/src/screens/home/repository/home_repository.dart';
import 'package:flutter_ecommerce/src/screens/home/result/home_result.dart';
import 'package:flutter_ecommerce/src/services/utils_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCategories();
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
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

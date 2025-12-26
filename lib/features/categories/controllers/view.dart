import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/repositories/categories_repository.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/models/category_model.dart';

class CategoriesController extends GetxController {
  final CategoriesRepository repository;

  CategoriesController(this.repository);

  final categories = <CategoryModel>[].obs;
  final status = StatusRequest.loading.obs;

  final isLoadingMore = false.obs;
  final hasMore = true.obs;

  int offset = 0;
  int limit = 10;

  @override
  void onInit() {
    fetchInitial();
    super.onInit();
  }

  Future<void> fetchInitial() async {
    status.value = StatusRequest.loading;
    offset = 0;
    categories.clear();
    repository.clearCache();

    try {
      final result = await repository.fetchCategories(offset, limit);

      result.fold(
        (failure) => status.value = failure,
        (data) {
          categories.assignAll(data);
          data.length < limit ? hasMore.value = false : hasMore.value = true;
          status.value = StatusRequest.success;
        },
      );
    } catch (e) {
      status.value = e as StatusRequest;
    }
  }

  Future<void> loadMore() async {
    if (!hasMore.value || isLoadingMore.value) return;

    isLoadingMore.value = true;
    offset += limit;

    try {
      final result = await repository.fetchCategories(offset, limit);
      result.fold((failure) => status.value = failure, (data) {
        categories.addAll(data);
        data.length < limit ? hasMore.value = false : hasMore.value = true;
      });
    } finally {
      isLoadingMore.value = false;
    }
  }

  void goToAddCategoryPage() {
    Get.toNamed(AppRoute.addCategory);
  }

  void goToEditCategoryPage(CategoryModel category) {
    Get.toNamed(AppRoute.editCategory, arguments: category);
  }

  deleteCategory(String categoryId, String imageName) async {
    final response = await repository.deleteCategory(
        categoryId: categoryId, imageName: imageName);

    response.fold((failure) => status.value = failure, (unit) {
      fetchInitial();
    });
  }

  void goBack() => Get.back();
}

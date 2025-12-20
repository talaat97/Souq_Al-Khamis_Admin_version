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
  final int limit = 10;

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
      final data = await repository.fetchCategories(offset);
      categories.assignAll(data);
      hasMore.value = data.length == limit;
      status.value = StatusRequest.success;
    } catch (e) {
      status.value = e as StatusRequest;
    }
  }

  Future<void> loadMore() async {
    if (!hasMore.value || isLoadingMore.value) return;

    isLoadingMore.value = true;
    offset += limit;

    try {
      final data = await repository.fetchCategories(offset);
      categories.addAll(data);
      if (data.length < limit) hasMore.value = false;
    } finally {
      isLoadingMore.value = false;
    }
  }

  void goToAddCategoryPage() {
    Get.toNamed(AppRoute.addCategory);
  }

  void goBack() => Get.back();
}

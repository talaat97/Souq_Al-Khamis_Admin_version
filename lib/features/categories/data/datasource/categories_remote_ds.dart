import 'dart:io';

import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class CategoriesRemoteDataSource {
  final Crud crud;

  CategoriesRemoteDataSource(this.crud);

  Future<Map> getCategories({
    required int offset,
    int limit = 10,
  }) async {
    final response = await crud.postData(
      Applink.categoriesView,
      {
        "offset": offset.toString(),
        "limit": limit.toString(),
      },
    );

    return response.fold((l) => throw l, (r) => r);
  }

  Future<Map> addCategory({
    required String name,
    required String nameAr,
    required File file,
  }) async {
    try {
      final response = await crud.addRequestWithImageOne(
        Applink.categoriesAdd,
        {
          "name": name,
          "name_ar": nameAr,
        },
        file,
        "file",
      );

      return response.fold(
        (l) => throw l,
        (r) => r,
      );
    } catch (e) {
      rethrow;
    }
  }
}

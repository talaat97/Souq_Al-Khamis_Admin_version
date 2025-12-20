import 'dart:io';

import 'package:souq_al_khamis_admin_version/features/categories/data/datasource/categories_remote_ds.dart';

import '../../../../core/class/status_request.dart';
import '../models/category_model.dart';

class CategoriesRepository {
  final CategoriesRemoteDataSource remote;

  final Map<int, List<CategoryModel>> _cache = {};

  CategoriesRepository(this.remote);

  Future<List<CategoryModel>> fetchCategories(int offset) async {
    if (_cache.containsKey(offset)) {
      return _cache[offset]!;
    }

    final response = await remote.getCategories(offset: offset);

    if (response['status'] != 'success') {
      throw StatusRequest.failure;
    }

    final data = (response['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    _cache[offset] = data;
    return data;
  }

  Future<void> addCategory(
      {required String name,
      required String nameAr,
      required File file}) async {
    final response =
        await remote.addCategory(name: name, nameAr: nameAr, file: file);
    if (response['status'] != 'success') {
      throw StatusRequest.failure;
    }
    return response['data'];
  }

  void clearCache() => _cache.clear();
}

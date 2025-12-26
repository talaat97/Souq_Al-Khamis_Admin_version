import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/features/categories/data/datasource/categories_remote_ds.dart';
import '../../../../core/class/api_response.dart';
import '../../../../core/class/status_request.dart';
import '../models/category_model.dart';

class CategoriesRepository {
  final CategoriesRemoteDataSource remote;
  final Map<int, List<CategoryModel>> _cache = {};

  CategoriesRepository(this.remote);

  Future<Either<StatusRequest, List<CategoryModel>>> fetchCategories(
      int offset, int limit) async {
    final result = await remote.getCategories(offset: offset, limit: limit);

    return result.fold(
      (failure) => Left(failure),
      (json) {
        final response = ApiResponse.fromJson(
          json,
          (data) =>
              (data as List).map((e) => CategoryModel.fromJson(e)).toList(),
        );

        if (!response.success || response.data == null) {
          return Left(StatusRequest.failure);
        }

        return Right(response.data!);
      },
    );
  }

  Future<Either<StatusRequest, Unit>> addCategory({
    required String name,
    required String nameAr,
    required File file,
  }) async {
    final response = await remote.addCategory(
      name: name,
      nameAr: nameAr,
      file: file,
    );

    return response.fold(
      (failure) => Left(failure),
      (map) => map['status'] == 'success'
          ? const Right(unit)
          : Left(StatusRequest.failure),
    );
  }

  Future<Either<StatusRequest, Unit>> deleteCategory({
    required String categoryId,
    required String imageName,
  }) async {
    final response = await remote.deleteCategory(
      categoryId: categoryId,
      imageName: imageName,
    );

    return response.fold(
      (failure) => Left(failure),
      (map) => map['status'] == 'success'
          ? const Right(unit)
          : Left(StatusRequest.failure),
    );
  }

  Future<Either<StatusRequest, Unit>> editCategory({
    required String categoryId,
    required String name,
    required String nameAr,
    required String imageOld,
    File? file,
  }) async {
    final response = await remote.editCategory(
      categoryId: categoryId,
      name: name,
      nameAr: nameAr,
      imageOld: imageOld,
      file: file,
    );

    return response.fold(
      (failure) => Left(failure),
      (map) => map['status'] == 'success'
          ? const Right(unit)
          : Left(StatusRequest.failure),
    );
  }

  void clearCache() => _cache.clear();
}

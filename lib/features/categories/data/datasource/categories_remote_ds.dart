import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';

import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class CategoriesRemoteDataSource {
  final Crud crud;

  CategoriesRemoteDataSource(this.crud);

  Future<Either<StatusRequest, Map>> getCategories({
    required int offset,
    required int limit,
  }) {
    return crud.postData(Applink.categoriesView, {
      "offset": offset.toString(),
      "limit": limit.toString(),
    });
  }

  Future<Either<StatusRequest, Map>> addCategory({
    required String name,
    required String nameAr,
    required File file,
  }) {
    return crud.addRequestWithImageOne(
      Applink.categoriesAdd,
      {
        "name": name,
        "nameAr": nameAr,
      },
      file,
      "file",
    );
  }

  Future<Either<StatusRequest, Map>> deleteCategory({
    required String categoryId,
    required String imageName,
  }) {
    return crud.postData(Applink.categoriesDelete, {
      "id": categoryId,
      "imageName": imageName,
    });
  }

  Future<Either<StatusRequest, Map>> editCategory({
    required String categoryId,
    required String name,
    required String nameAr,
    required String imageOld,
    File? file,
  }) {
    return crud.addRequestWithImageOne(
      Applink.categoriesEdit,
      {
        "id": categoryId,
        "name": name,
        "nameAr": nameAr,
        "imageold": imageOld,
      },
      file,
      "file",
    );
  }
}

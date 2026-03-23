import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';

import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class ItemsRemoteDataSource {
  final Crud crud;

  ItemsRemoteDataSource(this.crud);

  Future<Either<StatusRequest, Map>> getItems({
    required int offset,
    required int limit,
  }) {
    return crud.postData(Applink.itemsView, {
      "offset": offset.toString(),
      "limit": limit.toString(),
    });
  }

  Future<Either<StatusRequest, Map>> addItem({
    required String name,
    required String nameAr,
    required String description,
    required String descriptionAr,
    required String count,
    required String price,
    required String discount,
    required String active,
    required String categoryId,
    required File file,
  }) {
    return crud.addRequestWithImageOne(
      Applink.itemsAdd,
      {
        "name": name,
        "nameAr": nameAr,
        "desc": description,
        "descAr": descriptionAr,
        "count": count,
        "price": price,
        "discount": discount,
        "active": active,
        "catid": categoryId,
      },
      file,
      "file",
    );
  }

  Future<Either<StatusRequest, Map>> editItem({
    required String id,
    required String name,
    required String nameAr,
    required String imageOld,
    required String description,
    required String descriptionAr,
    required String count,
    required String price,
    required String discount,
    required String active,
    File? file,
  }) {
    return crud.addRequestWithImageOne(
      Applink.itemsEdit,
      {
        "id": id,
        "name": name,
        "nameAr": nameAr,
        "desc": description,
        "descAr": descriptionAr,
        "count": count,
        "price": price,
        "discount": discount,
        "active": active,
        "imageold": imageOld,
      },
      file,
      "file",
    );
  }

  Future<Either<StatusRequest, Map>> deleteItem({
    required String id,
    required String imageName,
  }) {
    return crud.postData(Applink.itemsDelete, {
      "id": id,
      "imageName": imageName,
    });
  }
}

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:souq_al_khamis_admin_version/features/items/data/datasource/items_remote_ds.dart';
import '../../../../core/class/api_response.dart';
import '../../../../core/class/status_request.dart';
import '../models/item_model.dart';

class ItemsRepository {
  final ItemsRemoteDataSource remote;
  final Map<int, List<ItemModel>> _cache = {};

  ItemsRepository(this.remote);

  Future<Either<StatusRequest, List<ItemModel>>> fetchItems(
      int offset, int limit) async {
    final result = await remote.getItems(offset: offset, limit: limit);

    return result.fold(
      (failure) => Left(failure),
      (json) {
        final response = ApiResponse.fromJson(
          json,
          (data) => (data as List).map((e) => ItemModel.fromJson(e)).toList(),
        );

        if (!response.success || response.data == null) {
          return Left(StatusRequest.failure);
        }

        return Right(response.data!);
      },
    );
  }

  Future<Either<StatusRequest, Unit>> addItem({
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
  }) async {
    final response = await remote.addItem(
      name: name,
      nameAr: nameAr,
      description: description,
      descriptionAr: descriptionAr,
      count: count,
      price: price,
      discount: discount,
      active: active,
      categoryId: categoryId,
      file: file,
    );

    return response.fold(
      (failure) => Left(failure),
      (map) => map['status'] == 'success'
          ? const Right(unit)
          : Left(StatusRequest.failure),
    );
  }

  Future<Either<StatusRequest, Unit>> deleteItem({
    required String itemId,
    required String imageName,
  }) async {
    final response = await remote.deleteItem(
      id: itemId,
      imageName: imageName,
    );

    return response.fold(
      (failure) => Left(failure),
      (map) => map['status'] == 'success'
          ? const Right(unit)
          : Left(StatusRequest.failure),
    );
  }

  Future<Either<StatusRequest, Unit>> editItem({
    required String itemId,
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
  }) async {
    final response = await remote.editItem(
      id: itemId,
      name: name,
      nameAr: nameAr,
      imageOld: imageOld,
      description: description,
      descriptionAr: descriptionAr,
      count: count,
      price: price,
      discount: discount,
      active: active,
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

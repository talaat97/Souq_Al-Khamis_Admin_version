import '../../../../core/class/curd.dart';
import '../../../../core/constant/links_api.dart';

class NotificationRemoteDataSource {
  final Crud crud;

  NotificationRemoteDataSource(this.crud);

  Future<Map> getNotifications({
    required int offset,
    int limit = 10,
  }) async {
    final response = await crud.postData(
      Applink.notification,
      {
        "offset": offset.toString(),
        "limit": limit.toString(),
      },
    );

    return response.fold((l) => throw l, (r) => r);
  }
}
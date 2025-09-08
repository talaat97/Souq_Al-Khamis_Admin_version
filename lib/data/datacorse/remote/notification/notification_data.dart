import '../../../../core/class/curd.dart';
import '../../../../link_api.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getNotification({required int offset, int limit = 10}) async {
    var response = await crud.postData(Applink.notification, {
      "offset": offset.toString(), // الأفضل إرسال String
      "limit": limit.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}

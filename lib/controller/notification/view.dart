import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/function/handling_data_controller.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/remote/notification/notification_data.dart';
import 'package:souq_al_khamis_admin_version/data/datacorse/static/model/notification_model.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  StatusRequest? statusRequest;
  List<NotificationModel> notificationList = [];

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  getNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.getNotification(offset: 0);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        notificationList
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reloadMoreNtification(int offset) async {
    var response = await notificationData.getNotification(offset: offset);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        notificationList
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToHome() {
    Get.back();
  }
}

import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/features/notification/data/repositories/notification_repository.dart';
import 'package:souq_al_khamis_admin_version/features/notification/data/models/notification_model.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository;

  NotificationController(this.repository);

  final notifications = <NotificationModel>[].obs;
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
    notifications.clear();
    repository.clearCache();

    try {
      final data = await repository.fetchNotifications(offset);
      notifications.assignAll(data);
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
      final data = await repository.fetchNotifications(offset);
      notifications.addAll(data);
      if (data.length < limit) hasMore.value = false;
    } finally {
      isLoadingMore.value = false;
    }
  }

  void goBack() => Get.back();
}

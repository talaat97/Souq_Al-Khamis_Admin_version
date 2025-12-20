import 'package:souq_al_khamis_admin_version/features/notification/data/datasource/notification_remote_ds.dart';

import '../../../../core/class/status_request.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  final NotificationRemoteDataSource remote;

  final Map<int, List<NotificationModel>> _cache = {};

  NotificationRepository(this.remote);

  Future<List<NotificationModel>> fetchNotifications(int offset) async {
    if (_cache.containsKey(offset)) {
      return _cache[offset]!;
    }

    final response = await remote.getNotifications(offset: offset);

    if (response['status'] != 'success') {
      throw StatusRequest.failure;
    }

    final data = (response['data'] as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();

    _cache[offset] = data;
    return data;
  }

  void clearCache() => _cache.clear();
}

import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/features/notification/data/models/notification_model.dart';

import '../../../../core/constant/colors.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ─── Title Row ──────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.notifications_active_outlined,
                  color: AppColor.primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.notificationTitle ?? 'Notification',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// ─── Order Info (if exists) ─────────────────
            if (item.notificationOrderId != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Order #${item.notificationOrderId}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.grey,
                  ),
                ),
              ),

            /// ─── Body ───────────────────────────────────
            Text(
              item.notificationBody ?? '',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            /// ─── Footer Meta Info ───────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// User
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: AppColor.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'User ${item.notificationUserid ?? '-'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),

                /// Time
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColor.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(item.notificationDateTime),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    return date; // You can replace this with timeago later
  }
}

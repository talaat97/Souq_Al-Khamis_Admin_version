import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/routs_page.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_model.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_status.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/widgets/order_status_badge.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final statusEnum = OrderStatusX.fromInt(order.orderStatus);
    final isPickup = order.orderType == "1";
    final isOnline = order.orderPaymentMethod == "1";

    String formattedDate = "";
    if (order.orderDatetime != null) {
      try {
        formattedDate = Jiffy.parse(order.orderDatetime!)
            .format(pattern: 'dd MMM yyyy - hh:mm a');
      } catch (e) {
        formattedDate = order.orderDatetime!;
      }
    }

    return Card(
      elevation: 0,
      color: statusEnum.color.withOpacity(0.04), // soft background tint
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color: statusEnum.color.withOpacity(0.4),
            width: 1.5), // matching border
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Get.toNamed(AppRoute.orderDetails, arguments: order);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${order.orderId}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  OrderStatusBadge(status: statusEnum),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(formattedDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _InfoChip(
                    icon: isPickup
                        ? Icons.storefront
                        : Icons.local_shipping_outlined,
                    label: isPickup ? 'pickup'.tr : 'delivery'.tr,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(width: 8),
                  _InfoChip(
                    icon: isOnline ? Icons.credit_card : Icons.money,
                    label: isOnline ? 'online'.tr : 'cash'.tr,
                    color: Colors.teal,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total_inc_delivery'.tr,
                      style: const TextStyle(color: Colors.brown, fontSize: 13)),
                  Text(
                    "\$${order.orderTotalPrice?.toStringAsFixed(2) ?? "0.00"}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final MaterialColor color;

  const _InfoChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color.shade700),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 11,
                  color: color.shade700,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

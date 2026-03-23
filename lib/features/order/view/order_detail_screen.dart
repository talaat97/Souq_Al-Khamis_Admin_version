import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_detail_controller.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_status.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/widgets/order_price_breakdown.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/widgets/order_status_timeline.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/widgets/cancel_order_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jiffy/jiffy.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text('order_details'.tr,
            style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GetX<OrderDetailController>(
        builder: (controller) {
          final order = controller.order.value;
          final statusEnum = OrderStatusX.fromInt(order.orderStatus);

          String formedDate = order.orderDatetime ?? "";
          try {
            formedDate = Jiffy.parse(formedDate)
                .format(pattern: 'dd MMM yyyy - hh:mm a');
          } catch (e) {}

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 1. Order ID & Date Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Text(
                      "Order #${order.orderId}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(formedDate,
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Badge(
                          text: order.orderType == "1" ? "Pickup" : "Delivery",
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(width: 8),
                        _Badge(
                          text: order.orderPaymentMethod == "1"
                              ? "Online"
                              : "Cash",
                          color: Colors.teal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 2. Timeline
              OrderStatusTimeline(currentStatus: statusEnum),
              const SizedBox(height: 16),

              // 3. Address Map
              if (order.orderAddress != "0" && order.addressCity != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('delivery_address'.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: AppColor.primaryColor),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.addressName ?? "Address",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  "${order.addressStreet}, ${order.addressCity}",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          if (order.addressLat != null &&
                              order.addressLng != null)
                            IconButton(
                              icon: const Icon(Icons.map, color: Colors.blue),
                              onPressed: () async {
                                final uri = Uri.parse(
                                    "https://www.google.com/maps/search/?api=1&query=${order.addressLat},${order.addressLng}");
                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),

              // 4. Price Breakdown
              OrderPriceBreakdown(
                subtotal: order.orderPrice ?? 0,
                deliveryFee: order.orderPriceDelivery ?? 0,
                total: order.orderTotalPrice ?? 0,
                couponCode: order.orderCoupon ?? "0",
              ),
              const SizedBox(height: 24),

              // 5. Action Buttons based on Status
              if (order.orderStatus == 1) // waitingApproval
                Column(
                  children: [
                    _ActionButton(
                      label: 'approve_order'.tr,
                      color: Colors.blue,
                      isLoading: controller.isLoadingAction.value,
                      onTap: () => controller.approveOrder(),
                    ),
                    const SizedBox(height: 8),
                    _ActionButton(
                      label: 'cancel_order'.tr,
                      color: Colors.red,
                      isLoading: controller.isLoadingAction.value,
                      onTap: () {
                        Get.dialog(CancelOrderDialog(controller: controller));
                      },
                    ),
                  ],
                )
              else if (order.orderStatus == 2) // pending
                _ActionButton(
                  label: 'cancel_order'.tr,
                  color: Colors.red,
                  isLoading: controller.isLoadingAction.value,
                  onTap: () {
                    Get.dialog(CancelOrderDialog(controller: controller));
                  },
                )
              else if (order.orderStatus == 3) // shipping
                _ActionButton(
                  label: 'mark_archived'.tr,
                  color: Colors.green,
                  isLoading: controller.isLoadingAction.value,
                  onTap: () => controller.updateDeliveryStatus("1"),
                )
              else if (order.orderStatus == 4 &&
                  order.orderRating != null &&
                  order.orderRating! > 0)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.orange),
                          const SizedBox(width: 8),
                          Text("${order.orderRating} / 5 Rating",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      if (order.orderRatingComment != null &&
                          order.orderRatingComment!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text('"${order.orderRatingComment}"',
                            style:
                                const TextStyle(fontStyle: FontStyle.italic)),
                      ]
                    ],
                  ),
                ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final MaterialColor color;
  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: color.shade50, borderRadius: BorderRadius.circular(20)),
      child: Text(text,
          style: TextStyle(
              color: color.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 13)),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool isLoading;

  const _ActionButton(
      {required this.label,
      required this.color,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 42),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: isLoading ? null : onTap,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2))
          : Text(label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/features/order/data/models/order_status.dart';

class OrderStatusTimeline extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderStatusTimeline({super.key, required this.currentStatus});

  int get _currentIndex {
    switch (currentStatus) {
      case OrderStatus.waitingApproval:
        return 0;
      case OrderStatus.pending:
        return 1;
      case OrderStatus.shipping:
        return 2;
      case OrderStatus.archived:
        return 3;
      default:
        return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentStatus == OrderStatus.cancelled) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          border: Border.all(color: Colors.red.shade200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "This order was cancelled",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    final steps = [
      ("Waiting Approval", Icons.pending_actions),
      ("Pending", Icons.inventory_2_outlined),
      ("Shipping", Icons.local_shipping_outlined),
      ("Archived", Icons.check_circle_outline),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            final active = (index ~/ 2) < _currentIndex;
            return Expanded(
              child: Container(
                height: 2,
                color: active ? currentStatus.color : Colors.grey.shade300,
              ),
            );
          }

          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < _currentIndex;
          final isCurrent = stepIndex == _currentIndex;

          Color iconColor;
          if (isCompleted) {
            iconColor = Colors.white;
          } else if (isCurrent) {
            iconColor = currentStatus.color;
          } else {
            iconColor = Colors.grey.shade400;
          }

          Color bgColor;
          if (isCompleted) {
            bgColor = currentStatus.color;
          } else if (isCurrent) {
            bgColor = currentStatus.color.withValues(alpha: 0.1);
          } else {
            bgColor = Colors.grey.shade100;
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor,
                  border: isCurrent
                      ? Border.all(color: currentStatus.color, width: 2)
                      : null,
                ),
                child: Icon(steps[stepIndex].$2, size: 20, color: iconColor),
              ),
              const SizedBox(height: 6),
              Text(
                steps[stepIndex].$1,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                  color:
                      isCurrent || isCompleted ? Colors.black87 : Colors.grey,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

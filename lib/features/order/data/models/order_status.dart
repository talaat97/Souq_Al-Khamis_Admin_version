import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

/// ORDER STATUS REFERENCE
/// ╔═══════╦══════════════════════════════════╦════════════════════╦══════════════════════╦═════════════╗
/// ║ Value ║ Admin Label                      ║ User Sees          ║ Delivery Sees        ║ Color       ║
/// ╠═══════╬══════════════════════════════════╬════════════════════╬══════════════════════╬═════════════╣
/// ║   0   ║ Cancelled                        ║ Cancelled          ║ —                    ║ Red         ║
/// ║   1   ║ Waiting Approval                 ║ Wait to approve    ║ Wait admin approval  ║ Yellow      ║
/// ║   2   ║ Pending (waiting driver pickup)  ║ Preparing          ║ Pending              ║ Deep Yellow ║
/// ║   3   ║ Shipping (driver took the order) ║ On the way         ║ Accepted / Working   ║ Green       ║
/// ║   4   ║ Archived (delivered)             ║ Archived           ║ Done / Archived      ║ Grey        ║
/// ╚═══════╩══════════════════════════════════╩════════════════════╩══════════════════════╩═════════════╝

enum OrderStatus {
  cancelled,
  waitingApproval,
  pending,
  shipping,
  archived,
  unknown
}

extension OrderStatusX on OrderStatus {
  static OrderStatus fromInt(int? value) {
    switch (value) {
      case 0:
        return OrderStatus.cancelled;
      case 1:
        return OrderStatus.waitingApproval;
      case 2:
        return OrderStatus.pending;
      case 3:
        return OrderStatus.shipping;
      case 4:
        return OrderStatus.archived;
      default:
        return OrderStatus.unknown;
    }
  }

  String get label {
    switch (this) {
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.waitingApproval:
        return 'Waiting Approval';
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.shipping:
        return 'Shipping';
      case OrderStatus.archived:
        return 'Archived';
      case OrderStatus.unknown:
        return 'Unknown';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.cancelled:
        return AppColor.errorColor;
      case OrderStatus.waitingApproval:
        return OrderStatusColor.waiting;
      case OrderStatus.pending:
        return OrderStatusColor.preparing;
      case OrderStatus.shipping:
        return OrderStatusColor.shipping;
      case OrderStatus.archived:
        return OrderStatusColor.archived;
      case OrderStatus.unknown:
        return AppColor.neutralMedium;
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStatus.cancelled:
        return Icons.cancel_outlined;
      case OrderStatus.waitingApproval:
        return Icons.pending_actions;
      case OrderStatus.pending:
        return Icons.inventory_2_outlined;
      case OrderStatus.shipping:
        return Icons.local_shipping_outlined;
      case OrderStatus.archived:
        return Icons.check_circle_outline;
      case OrderStatus.unknown:
        return Icons.error_outline;
    }
  }
}

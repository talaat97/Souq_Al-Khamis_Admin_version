import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_detail_controller.dart';

class CancelOrderDialog extends StatefulWidget {
  final OrderDetailController controller;
  const CancelOrderDialog({super.key, required this.controller});

  @override
  State<CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<CancelOrderDialog> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('cancel_order_title'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('cancel_order_confirm'.tr),
          const SizedBox(height: 16),
          TextField(
            controller: _reasonController,
            decoration: InputDecoration(
              hintText: 'cancel_reason_hint'.tr,
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child:
              Text('keep_order'.tr, style: const TextStyle(color: Colors.grey)),
        ),
        Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: widget.controller.isLoadingAction.value
                  ? null
                  : () {
                      widget.controller
                          .cancelOrder(_reasonController.text.trim());
                    },
              child: widget.controller.isLoadingAction.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : Text('cancel_order'.tr,
                      style: const TextStyle(color: Colors.white)),
            )),
      ],
    );
  }
}

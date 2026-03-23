import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPriceBreakdown extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String couponCode;

  const OrderPriceBreakdown({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.couponCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _BreakdownRow(
              label: 'subtotal'.tr, value: "\$${subtotal.toStringAsFixed(2)}"),
          const SizedBox(height: 8),
          _BreakdownRow(
              label: 'delivery_fee'.tr,
              value: "\$${deliveryFee.toStringAsFixed(2)}"),
          if (couponCode != "0") ...[
            const SizedBox(height: 8),
            _BreakdownRow(
              label: "${'coupon'.tr} ($couponCode)",
              value: 'applied'.tr,
              isHighlight: true,
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isHighlight;

  const _BreakdownRow({
    required this.label,
    required this.value,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.w500,
            color: isHighlight ? Colors.green : Colors.black87,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

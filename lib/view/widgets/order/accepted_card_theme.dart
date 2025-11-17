import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/colors.dart';
import '../../../core/function/order_functions.dart';
import '../../../data/datacorse/static/model/order_model.dart';

class CustomOrderCard extends StatelessWidget {
  final OrderModel orderModel;
  final VoidCallback? onAction;

  const CustomOrderCard({
    super.key,
    required this.orderModel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = getOrderColor(orderModel.orderStatus!);
    final statusText = getOrderStatusText(orderModel.orderStatus!);

    return Card(
      color: statusColor.withOpacity(0.43),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: ${orderModel.orderId}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                Text(Jiffy.parse("${orderModel.orderDatetime}").fromNow()),
              ],
            ),

            const Divider(),

            Text("Payment : ${orderModel.orderPaymentMethod}"),
            Text("Type : ${orderModel.orderType}"),
            Text("Delivery : ${orderModel.orderPriceDelivery}"),
            Text("Order Price : ${orderModel.orderPrice}"),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total : ${orderModel.orderTotalPrice}\$",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Dynamic Button Based on Status
                if (orderModel.orderStatus != 4)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: onAction,
                      child: Text(
                        statusText,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

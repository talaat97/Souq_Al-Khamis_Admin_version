import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';

import '../../../core/class/handling_data.dart';
import '../../../core/constant/colors.dart';
import '../../../core/function/order_functions.dart';
import '../../../data/datacorse/remote/model/order_model.dart';

class AcceptedThemeCard extends StatelessWidget {
  final OrderModel orderModel;
  final StatusRequest statusRequest;
  final Color color;
  final void Function()? orderArchive;
  final void Function()? goToOrderDetails;
  const AcceptedThemeCard({
    super.key,
    required this.orderModel,
    required this.statusRequest,
    required this.color,
    this.orderArchive,
    required this.goToOrderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
        statusRequest: statusRequest,
        widget: Card(
          color: color,
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order ID : ${orderModel.orderId}',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      Jiffy.parse('${orderModel.orderDatetime}').fromNow(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  ' payment  : ${printOrrderPaymentMethod(orderModel.orderPaymentMethod!)}',
                  style: const TextStyle(fontSize: 20, color: AppColor.grey),
                ),
                Text(
                  ' Type  : ${printOrderType(orderModel.orderType!)}',
                  style: const TextStyle(fontSize: 20, color: AppColor.grey),
                ),
                Text(
                  ' Delivery : ${printDeliverPriceOrder(orderModel.orderPriceDelivery!)}',
                  style: const TextStyle(fontSize: 20, color: AppColor.grey),
                ),
                Text(
                  'Order Price  : ${orderModel.orderPrice}',
                  style: const TextStyle(fontSize: 20, color: AppColor.grey),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price: ${orderModel.orderTotalPrice}\$',
                      style: const TextStyle(
                          fontSize: 23,
                          color: AppColor.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.grey600,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: goToOrderDetails,
                        child: const Text(
                          'Details',
                          style: TextStyle(fontSize: 18, color: AppColor.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.green2Color,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: InkWell(
                        onTap: orderArchive,
                        child: const Text(
                          '  Done  ',
                          style: TextStyle(fontSize: 18, color: AppColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

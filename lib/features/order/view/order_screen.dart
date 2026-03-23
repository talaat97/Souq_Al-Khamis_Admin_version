import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_controller.dart';
import 'package:souq_al_khamis_admin_version/features/order/view/widgets/order_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController(Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الطلبــــات',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.surfaceColor),
        ),
        elevation: 5,
      ),
      body: GetX<OrderController>(
        builder: (controller) {
          return Column(
            children: [
              // Custom TabBar mapped to status integers
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      _TabChip(label: "All", index: 0, controller: controller),
                      const SizedBox(width: 8),
                      _TabChip(
                          label: "Waiting", index: 1, controller: controller),
                      const SizedBox(width: 8),
                      _TabChip(
                          label: "Pending", index: 2, controller: controller),
                      const SizedBox(width: 8),
                      _TabChip(
                          label: "Shipping", index: 3, controller: controller),
                      const SizedBox(width: 8),
                      _TabChip(
                          label: "Archived", index: 4, controller: controller),
                      const SizedBox(width: 8),
                      _TabChip(
                          label: "Cancelled", index: 5, controller: controller),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: HandlingDataView(
                  statusRequest: controller.status.value,
                  widget: RefreshIndicator(
                    onRefresh: () async => controller.refreshOrders(),
                    child: ListView.builder(
                      controller: controller.scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.orderList.length +
                          (controller.isLoadingMore.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == controller.orderList.length) {
                          return const Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return OrderCard(order: controller.orderList[index]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final int index;
  final OrderController controller;

  const _TabChip(
      {required this.label, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isActive = controller.activeTab.value == index;
    return InkWell(
      onTap: () => controller.onTabSwitched(index),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

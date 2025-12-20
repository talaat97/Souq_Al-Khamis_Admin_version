import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';
import 'package:souq_al_khamis_admin_version/features/order/dummy_order_data.dart';
import 'package:souq_al_khamis_admin_version/features/order/widgets/accepted_card_theme.dart';

final orders = dummyOrderList;

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key});

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'تحت القبول'),
            Tab(text: 'تجهيز'),
            Tab(text: 'الأرشيف'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // View Orders Tab
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) => CustomOrderCard(
              orderModel: orders[index],
              onAction: () {},
            ),
          ),
          // Approve Tab
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) => CustomOrderCard(
              orderModel: orders[index],
              onAction: () {
                // Add approve logic here
              },
            ),
          ),
          // Archive Tab
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) => CustomOrderCard(
              orderModel: orders[index],
              onAction: () {
                // Add archive logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

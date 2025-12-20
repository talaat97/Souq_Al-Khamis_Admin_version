import 'package:flutter/material.dart';

import 'package:souq_al_khamis_admin_version/features/order/dummy_order_data.dart';
import 'package:souq_al_khamis_admin_version/features/order/widgets/accepted_card_theme.dart';

final orders = dummyOrderList;

class Approved extends StatelessWidget {
  const Approved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) => CustomOrderCard(
          orderModel: orders[index],
          onAction: () {},
        ),
      ),
    );
  }
}

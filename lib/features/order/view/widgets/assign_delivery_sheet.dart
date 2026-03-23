import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq_al_khamis_admin_version/core/class/curd.dart';
import 'package:souq_al_khamis_admin_version/core/class/status_request.dart';
import 'package:souq_al_khamis_admin_version/core/constant/links_api.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/data/models/delivery_model.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_controller.dart';
import 'package:souq_al_khamis_admin_version/features/order/controller/order_detail_controller.dart';

class AssignDeliverySheet extends StatefulWidget {
  const AssignDeliverySheet({super.key});

  @override
  State<AssignDeliverySheet> createState() => _AssignDeliverySheetState();
}

class _AssignDeliverySheetState extends State<AssignDeliverySheet> {
  final crud = Get.find<Crud>();
  var status = StatusRequest.loading;
  List<DeliveryModel> drivers = [];
  bool isAssigning = false;

  @override
  void initState() {
    super.initState();
    _fetchDrivers();
  }

  Future<void> _fetchDrivers() async {
    final response = await crud
        .postData(Applink.deliveriesView, {"limit": "50", "offset": "0"});
    response.fold(
      (failure) => setState(() => status = failure),
      (data) {
        if (data['status'] == "success") {
          List raw = data['data'];
          setState(() {
            drivers = raw.map((e) => DeliveryModel.fromJson(e)).toList();
            status = StatusRequest.success;
          });
        } else {
          setState(() => status = StatusRequest.failure);
        }
      },
    );
  }

  Future<void> _assignDriver(DeliveryModel driver) async {
    setState(() => isAssigning = true);
    final detailController = Get.find<OrderDetailController>();
    final order = detailController.order.value;

    final response = await crud.postData(
      Applink
          .approveOrder, // using approve as proxy to assign driver based on existing flow logic
      {
        "orderId": order.orderId.toString(),
        "userid": order.orderUserId.toString(),
        "deliveryId": driver.deliveriesId.toString(),
        "deviceToken": order.orderUserDeviceToken ?? ""
      },
    );

    response.fold(
      (failure) => Get.snackbar("Error", "Assignment failed network"),
      (data) {
        if (data['status'] == 'success') {
          Get.snackbar("Success", "Driver ${driver.deliveryName} assigned.");
          Get.find<OrderController>().refreshOrders();
          Get.back(); // close sheet
        } else {
          Get.snackbar("Error", "Assignment rejected by server.");
        }
      },
    );
    if (mounted) setState(() => isAssigning = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Assign Driver",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  icon: const Icon(Icons.close), onPressed: () => Get.back()),
            ],
          ),
          const Divider(),
          if (status == StatusRequest.loading)
            const Padding(
                padding: EdgeInsets.all(30), child: CircularProgressIndicator())
          else if (status != StatusRequest.success || drivers.isEmpty)
            const Padding(
                padding: EdgeInsets.all(30), child: Text("No drivers found."))
          else
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: drivers.length,
                separatorBuilder: (c, i) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final driver = drivers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child:
                          const Icon(Icons.delivery_dining, color: Colors.blue),
                    ),
                    title: Text(driver.deliveryName ?? "Unknown Driver"),
                    subtitle: Text(driver.deliveryPhone ?? "No Phone"),
                    trailing: isAssigning
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : TextButton(
                            onPressed: () => _assignDriver(driver),
                            child: const Text("Assign"),
                          ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

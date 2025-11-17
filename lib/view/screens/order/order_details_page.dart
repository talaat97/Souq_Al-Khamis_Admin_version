import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/order/order_details_controller.dart';
import '../../../core/class/handling_data.dart';
import '../../../core/constant/colors.dart';
import '../../widgets/order/details_text_table_style.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(Orderdetailscontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<Orderdetailscontroller>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Table(
                    children: [
                      const TableRow(children: [
                        DetailsTextTableStyle(text: 'Items'),
                        DetailsTextTableStyle(text: 'count'),
                        DetailsTextTableStyle(text: 'Price')
                      ]),
                      ...List.generate(
                        pageController.orderDetailsList.length,
                        (index) => TableRow(
                          children: [
                            DetailsTextTableStyle(
                              text: pageController
                                  .orderDetailsList[index].iteamsName!,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            DetailsTextTableStyle(
                              text: pageController
                                  .orderDetailsList[index].countItems!
                                  .toString(),
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            DetailsTextTableStyle(
                              text: '${pageController.itemPriceDiscount(
                                double.parse(pageController
                                    .orderDetailsList[index].iteamsPrice!),
                                double.parse(pageController
                                    .orderDetailsList[index].iteamsDiscount!),
                              )}',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DetailsTextTableStyle(
              text:
                  'total price:${pageController.orderModel.orderTotalPrice}\$',
              fontSize: 25,
            ),
          ),
          Card(
            child: Column(
              children: [
                if (pageController.orderModel.orderType == '0')
                  ListTile(
                    title: Text(
                      '${pageController.orderModel.addressName} ,${pageController.orderModel.addressCity}',
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontSize: 25),
                    ),
                    subtitle:
                        Text('${pageController.orderModel.addressStreet}'),
                    subtitleTextStyle:
                        const TextStyle(color: AppColor.black, fontSize: 15),
                  ),
                if (pageController.orderModel.orderType == '1')
                  SizedBox(
                    height: 350,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: pageController.cameraPosition!,
                      onMapCreated: (GoogleMapController controllerMap) {
                        pageController.googleMapController!
                            .complete(controllerMap);
                      },
                      markers: pageController.marker.toSet(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

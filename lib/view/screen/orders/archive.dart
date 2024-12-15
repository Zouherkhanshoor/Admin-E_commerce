import 'package:flutter/material.dart';
import 'package:test_app/controller/orders/archive_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/view/widget/orders/orderslistcardarchive.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => CardOrdersListArchive(
                            listdata: controller.data[index],
                          )),
                )));
  }
}

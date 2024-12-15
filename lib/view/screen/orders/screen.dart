import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/orders/screen_controller.dart';
import 'package:test_app/view/widget/orders/custombutomappbarhome.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(title: const Text("Orders")),
            bottomNavigationBar: const CustomBotomAppBarHome(),
            body: controller.listpage.elementAt(controller.currentpage)));
  }
}

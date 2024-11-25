import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/test_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primarycolor,
        title: const Text("Title"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return Text("${controller.data}");
              },
            ));
      }),
    );
  }
}

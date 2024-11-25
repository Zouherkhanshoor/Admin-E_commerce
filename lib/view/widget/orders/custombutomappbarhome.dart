import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/orders/screen_controller.dart';
import 'package:test_app/view/widget/home/custombottomappbar.dart';

class CustomBotomAppBarHome extends StatelessWidget {
  const CustomBotomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listpage.length, ((index) {
                    return Expanded(
                      child: CustomButtomAppBar(
                          onPressed: () {
                            controller.changePage(index);
                          },
                          textbutton: controller.buttonappbar[index]["title"],
                          icondata: controller.buttonappbar[index]["icon"],
                          active:
                              controller.currentpage == index ? true : false),
                    );
                  })),
                ],
              ),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/items/view_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/linkapi.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.itemsadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<ItemsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: PopScope(
                  onPopInvokedWithResult: (didPop, result) {
                    controller.whenback();
                  },
                  canPop: false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: CachedNetworkImage(
                                      height: 100,
                                      imageUrl:
                                          "${AppLink.imageItems}/${controller.data[index].itemsImage}"),
                                )),
                            Expanded(
                                flex: 4,
                                child: ListTile(
                                  trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.goToPageEdit(
                                                  controller.data[index]);
                                            },
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: "Warning",
                                                middleText:
                                                    "Are you sure to delete category",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoiresId!,
                                                      controller.data[index]
                                                          .categoiresImage!);
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline)),
                                      ]),
                                  subtitle:
                                      Text(controller.data[index].itemsDate!),
                                  title:
                                      Text(controller.data[index].itemsName!),
                                )),
                          ],
                        ));
                      },
                    ),
                  ),
                ))));
  }
}

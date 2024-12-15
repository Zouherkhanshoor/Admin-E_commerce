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
          child: const Icon(Icons.add),
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
                        return InkWell(
                          onLongPress: () {
                            Get.defaultDialog(
                              title: "Warning",
                              middleText: "You Are sure to Edit Items",
                              onCancel: () {},
                              onConfirm: () {
                                controller.goToPageEdit(controller.data[index]);
                              },
                            );
                          },
                          child: Card(
                              child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
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
                                                Get.defaultDialog(
                                                  title: "Warning",
                                                  middleText:
                                                      "Are you sure to delete category",
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    controller.deleteItems(
                                                        controller.data[index]
                                                            .itemsId!,
                                                        controller.data[index]
                                                            .itemsImage!);
                                                    Get.back();
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                  Icons.delete_outline)),
                                        ]),
                                    subtitle: Text(
                                        controller.data[index].categoiresName!),
                                    title:
                                        Text(controller.data[index].itemsName!),
                                  )),
                            ],
                          )),
                        );
                      },
                    ),
                  ),
                ))));
  }
}

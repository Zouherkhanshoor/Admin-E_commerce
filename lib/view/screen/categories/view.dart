import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/categories/view_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/linkapi.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.categoriesadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<CategoriesController>(
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
                              middleText: " you are going to Edit category",
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
                                            "${AppLink.imageCategories}/${controller.data[index].categoiresImage}"),
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
                                    subtitle: Text(controller
                                        .data[index].categoiresDatetime!),
                                    title: Text(
                                        controller.data[index].categoiresName!),
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

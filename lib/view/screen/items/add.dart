import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/categories/add_controller.dart';
import 'package:test_app/controller/items/add_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/core/shared/custombutton.dart';
import 'package:test_app/core/shared/customdropdownsearch.dart';
import 'package:test_app/core/shared/customtextformglobal.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Items'),
        ),
        body: GetBuilder<ItemsAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "item name ( English )",
                              labeltext: "item name ( English )",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "item name ( Arabic )",
                              labeltext: "item name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "description name ( English )",
                              labeltext: "description name ( English )",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "description name ( Arabic )",
                              labeltext: "description name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Count  ",
                              labeltext: "Count ",
                              iconData: Icons.category,
                              mycontroller: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 10, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "Price  ",
                              labeltext: "Price  ",
                              iconData: Icons.category,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 2, 20, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "Discount ",
                              labeltext: "Discount ",
                              iconData: Icons.category,
                              mycontroller: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomDropDownSearch(
                              title: "Choose Category",
                              listdata: controller.dropdownlist,
                              dropDownSelectedName: controller.catname!,
                              dropDownSelectedId: controller.catid!),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.fourthcolor,
                              textColor: Colors.white,
                              onPressed: () {
                                controller.showOptionImage();
                              },
                              child: const Text("Choose item Image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              width: 200,
                              height: 200,
                            ),
                          CustomButton(
                            text: "Add Item",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

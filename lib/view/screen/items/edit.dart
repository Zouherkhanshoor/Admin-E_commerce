import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/items/add_controller.dart';
import 'package:test_app/controller/items/edit_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/core/shared/custombutton.dart';
import 'package:test_app/core/shared/customdropdownsearch.dart';
import 'package:test_app/core/shared/customtextformglobal.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Items'),
        ),
        body: GetBuilder<ItemsEditController>(
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
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "item name ( Arabic )",
                              labeltext: "item name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "description name ( English )",
                              labeltext: "description name ( English )",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 3, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "description name ( Arabic )",
                              labeltext: "description name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 3, 200, "");
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
                                return validInput(val!, 1, 20, "");
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
                          const SizedBox(height: 10),
                          RadioListTile(
                              title: const Text("Active"),
                              value: "1",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          RadioListTile(
                              title: const Text("Hidden"),
                              value: "0",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.fourthcolor,
                              textColor: Colors.white,
                              onPressed: () {
                                // controller.showOptionImage();
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
                            text: "Save",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

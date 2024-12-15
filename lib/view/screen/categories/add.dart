import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/categories/add_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/core/shared/custombutton.dart';
import 'package:test_app/core/shared/customtextformglobal.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Category'),
        ),
        body: GetBuilder<CategoriesAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "category name ( English )",
                              labeltext: "category name ( English )",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "category name ( Arabic )",
                              labeltext: "category name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              isNumber: false),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.fourthcolor,
                              textColor: Colors.white,
                              onPressed: () {
                                controller.chooseimage();
                              },
                              child: const Text("Choose Category Image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(controller.file!),
                          CustomButton(
                            text: "Add Category",
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

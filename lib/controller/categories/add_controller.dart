import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/categories/view_controller.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/core/functions/uploadfile.dart';
import 'package:test_app/data/datasource/remote/categories_data.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  chooseimage() async {
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warning", "please choose image");
      }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": namear.text};
      var response = await categoriesData.addData(data, file!);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesview);
          CategoriesController cat = Get.find();
          cat.getData();
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}

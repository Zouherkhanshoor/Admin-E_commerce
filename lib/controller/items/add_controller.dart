import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/categories/view_controller.dart';
import 'package:test_app/controller/items/view_controller.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/core/functions/uploadfile.dart';
import 'package:test_app/data/datasource/remote/categories_data.dart';
import 'package:test_app/data/datasource/remote/items_data.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  String? catid;

  File? file;

  showOptionImage() {
    showbottommenu(chooseimageCamera, chooseimageGallery);
  }

  chooseimageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseimageGallery() async {
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
      var response = await itemsData.addData(data, file!);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
          c.getData();
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
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    super.onInit();
  }
}

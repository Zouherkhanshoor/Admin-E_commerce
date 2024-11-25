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
import 'package:test_app/data/model/categoriesmodel.dart';
import 'package:test_app/data/model/itemsmodel.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ItemsModel? itemsModel;

  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  chooseimage() async {
    file = await fileUploadGallery(false);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.categoiresId!.toString(),
        "name": name.text,
        "namear": namear.text,
        "imageold": itemsModel!.categoiresImage
      };
      var response = await itemsData.editData(data, file);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsController items = Get.find();
          items.getData();
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    super.onInit();
  }
}

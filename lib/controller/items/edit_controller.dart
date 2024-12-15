import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/items/view_controller.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/core/functions/uploadfile.dart';
import 'package:test_app/data/datasource/remote/items_data.dart';
import 'package:test_app/data/model/itemsmodel.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<SelectedListItem> dropdownlist = [];

  StatusRequest? statusRequest = StatusRequest.none;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catname;
  TextEditingController? catid;

  File? file;
  ItemsModel? itemsModel;
  String? active;

  changeStatusActive(val) {
    active = val;
    update();
  }

  chooseimage() async {
    file = await fileUploadGallery(false);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "imageold": itemsModel!.itemsImage,
        "active": active,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString(),
        "price": price.text
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
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    price.text = itemsModel!.itemsPrice!;
    discount.text = itemsModel!.itemsDiscount!;
    active = itemsModel!.itemsActive;
    count.text = itemsModel!.itemsCount!;
    catid!.text = itemsModel!.categoiresId!;
    catname!.text = itemsModel!.categoiresName!;
    super.onInit();
  }
}

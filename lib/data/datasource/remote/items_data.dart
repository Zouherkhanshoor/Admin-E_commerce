import 'dart:io';

import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.itemsdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}

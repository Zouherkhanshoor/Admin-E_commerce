import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_app/core/class/crud.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/linkapi.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  get() async {
    var response = await crud.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoriesadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if (file == null) {
      response = await crud.postData(AppLink.categoriesedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}

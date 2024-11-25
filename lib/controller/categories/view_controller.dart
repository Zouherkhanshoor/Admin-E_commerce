import 'package:get/get.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/data/datasource/remote/categories_data.dart';
import 'package:test_app/data/model/categoriesmodel.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) {
    categoriesData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoiresId == id);
    update();
  }

  goToPageEdit(CategoriesModel categoriesmodel) {
    Get.toNamed(AppRoute.categoriesedite,
        arguments: {"categoriesModel": categoriesmodel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  whenback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}

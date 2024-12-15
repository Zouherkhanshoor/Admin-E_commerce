import 'package:get/get.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/data/datasource/remote/items_data.dart';
import 'package:test_app/data/model/itemsmodel.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData();
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {"itemsModel": itemsModel});
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

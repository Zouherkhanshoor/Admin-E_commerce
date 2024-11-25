import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/core/services/services.dart';
import 'package:test_app/data/datasource/remote/orders/archive_data.dart';
import 'package:test_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Resive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "the order is prepared";
    } else if (val == "2") {
      return "Ready to Picked up by Delivery man";
    } else if (val == "3") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("===============================controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  refreshorder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}

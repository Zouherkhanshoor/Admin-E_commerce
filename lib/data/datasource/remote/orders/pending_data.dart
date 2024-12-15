import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveorderData(String usersid, String ordersid) async {
    var response = await crud.postData(
        AppLink.approveOrders, {"usersid": usersid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}

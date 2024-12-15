import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String usersid, String orderstype) async {
    var response = await crud.postData(AppLink.prepare, {
      "ordersid": ordersid,
      "usersid": usersid,
      "orderstype": orderstype,
    });
    return response.fold((l) => l, (r) => r);
  }
}

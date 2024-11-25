import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {
      "id": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  doneDeliveryData(String ordersid, String usersid) async {
    var response = await crud.postData(AppLink.doneOrders, {
      "ordersid": ordersid,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}

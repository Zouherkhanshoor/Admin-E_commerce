import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.detailsOrders, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
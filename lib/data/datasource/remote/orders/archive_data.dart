import 'package:test_app/core/class/crud.dart';
import 'package:test_app/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}

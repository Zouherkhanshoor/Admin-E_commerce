import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view/screen/orders/accepted.dart';
import 'package:test_app/view/screen/orders/pending.dart';

abstract class OrdersScreenController extends GetxController {
  changePage(int i);
}

class OrdersScreenControllerImp extends OrdersScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const OrdersPending(),
    const OrdersAccepted(),
  ];

  List buttonappbar = [
    {"title": "pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.playlist_add_check_circle_sharp},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}

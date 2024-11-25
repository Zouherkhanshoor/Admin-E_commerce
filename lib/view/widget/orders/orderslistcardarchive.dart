import 'package:flutter/material.dart';
import 'package:test_app/controller/orders/archive_controller.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Orders Number : #${listdata.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                // Text(listdata.ordersDatetime!)
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans"),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order type : ${controller.printOrderType(listdata.ordersType!)}"),
            Text("Order price : ${listdata.ordersPrice} \$"),
            Text("delivery price : ${listdata.ordersPricedelivery} \$"),
            Text(
                "payment method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
            Text(
                "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${listdata.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.secoundcolor,
                  textColor: Colors.white,
                  child: const Text("Details"),
                ),
                SizedBox(width: 10),
                if (listdata.ordersRating == "0")
                  MaterialButton(
                    onPressed: () {},
                    color: AppColor.fourthcolor,
                    textColor: Colors.white,
                    child: const Text("Rating"),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/controller/orders/details_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: GetBuilder<OrdersDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    const TableRow(children: [
                                      Text(
                                        "Item",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "QTY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Price",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    // TableRow(children: [
                                    //   Text("mac book",
                                    //       textAlign: TextAlign.center),
                                    //   Text("5", textAlign: TextAlign.center),
                                    //   Text("1200", textAlign: TextAlign.center),
                                    // ]),
                                    // TableRow(children: [
                                    //   Text("S22 Ultra",
                                    //       textAlign: TextAlign.center),
                                    //   Text("6", textAlign: TextAlign.center),
                                    //   Text("3500", textAlign: TextAlign.center),
                                    // ])
                                    ...List.generate(
                                        controller.data.length,
                                        (index) => TableRow(children: [
                                              Text(
                                                  "${controller.data[index].itemsName}",
                                                  textAlign: TextAlign.center),
                                              Text(
                                                  "${controller.data[index].countitems}",
                                                  textAlign: TextAlign.center),
                                              Text(
                                                  "${controller.data[index].itemsprice}",
                                                  textAlign: TextAlign.center),
                                            ]))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "totalprice : ${controller.ordersmodel.ordersTotalprice} \$",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColor.primarycolor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        if (controller.ordersmodel.ordersType == "0")
                          Card(
                            child: SizedBox(
                              child: ListTile(
                                title: const Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                      color: AppColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.ordersmodel.addressCity} ${controller.ordersmodel.addressStreet}"),
                              ),
                            ),
                          ),
                        if (controller.ordersmodel.ordersType == "0")
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 400,
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllermap) {
                                  controller.completercontroller
                                      .complete(controllermap);
                                },
                              ),
                            ),
                          )
                      ],
                    ),
                  ))),
    );
  }
}

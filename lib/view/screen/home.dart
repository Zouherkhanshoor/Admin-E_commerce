import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/homecontroller.dart';
import 'package:test_app/core/constant/imageasset.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/view/widget/home/cardadmin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdminHome(
                  url: AppImageAsset.notification,
                  title: "notifications",
                  onpressed: () {}),
              CardAdminHome(
                  url: AppImageAsset.categories,
                  title: "categories",
                  onpressed: () {
                    Get.toNamed(AppRoute.categoriesview);
                  }),
              CardAdminHome(
                url: AppImageAsset.items,
                title: "Items",
                onpressed: () {
                  Get.toNamed(AppRoute.itemsview);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.orders,
                title: "Orders",
                onpressed: () {},
              ),
              CardAdminHome(
                url: AppImageAsset.report,
                title: "Reprots",
                onpressed: () {},
              ),
              CardAdminHome(
                url: AppImageAsset.users,
                title: "users",
                onpressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/star.svg

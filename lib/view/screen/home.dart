import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/homecontroller.dart';
import 'package:test_app/core/constant/imageasset.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/alertexitapp.dart';
import 'package:test_app/view/widget/home/cardadmin.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: PopScope<Object>(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              return;
            }
            alertExitApp();
          },
          child: ListView(
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getValueForScreenType<int>(
                      context: context,
                      mobile: 3,
                      tablet: 4,
                      desktop: 5,
                    ),
                    mainAxisExtent: 150),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
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
                    onpressed: () {
                      Get.toNamed(AppRoute.ordershome);
                    },
                  ),
                  CardAdminHome(
                    url: AppImageAsset.users,
                    title: "users",
                    onpressed: () {},
                  ),
                  CardAdminHome(
                    url: AppImageAsset.report,
                    title: "Reprots",
                    onpressed: () {},
                  ),
                  CardAdminHome(
                      url: AppImageAsset.notification,
                      title: "notifications",
                      onpressed: () {}),
                ],
              )
            ],
          ),
        ));
  }
}

// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/star.svg

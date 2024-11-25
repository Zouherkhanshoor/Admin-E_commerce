import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/localization/changelocal.dart';
import 'package:test_app/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            CustomButtomLang(
              textbutton: "Arabic",
              onPressed: () {
                controller.changelang("ar");
                Get.toNamed(AppRoute.login);
              },
            ),
            CustomButtomLang(
              textbutton: "English",
              onPressed: () {
                controller.changelang("en");
                Get.toNamed(AppRoute.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

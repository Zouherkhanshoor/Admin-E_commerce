import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/binding.dart';
import 'package:test_app/core/localization/changelocal.dart';
import 'package:test_app/core/localization/translation.dart';
import 'package:test_app/core/services/services.dart';
import 'package:test_app/routes.dart';
// import 'package:new_app/test.dart';
// import 'package:new_app/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo ",
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      //  const Test(),
      // routes: routes,
      getPages: routes,
    );
  }
}

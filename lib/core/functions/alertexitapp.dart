import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Alert",
      titleStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.primarycolor),
      middleText: "Did you want to exit app",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("Confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
      ]);
  return Future.value(true);
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/core/services/services.dart';
import 'package:test_app/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
        email.text,
        password.text,
      );
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);

          myServices.sharedPreferences
              .setString("id", response["data"]["admin_id"].toString());

          myServices.sharedPreferences
              .setString("username", response["data"]["admin_name"]);
          myServices.sharedPreferences
              .setString("email", response["data"]["admin_email"]);
          myServices.sharedPreferences
              .setString("phone", response["data"]["admin_phone"].toString());
          myServices.sharedPreferences.setString("step", "2");
          String adminid = myServices.sharedPreferences.getString("id")!;
          FirebaseMessaging.instance.subscribeToTopic("admin");
          FirebaseMessaging.instance.subscribeToTopic("admin${adminid}");
          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(
              title: "Warnning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("token=================================");
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

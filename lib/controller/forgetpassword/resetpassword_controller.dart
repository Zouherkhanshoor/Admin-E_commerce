import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/routes.dart';
import 'package:test_app/core/functions/handlingdatacontroller.dart';
import 'package:test_app/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  String? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  late TextEditingController password;
  late TextEditingController repassword;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warrning", middleText: "password Not Match");
    }

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      print("===============================controller $response ");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Warnning", middleText: "Try Again");
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}

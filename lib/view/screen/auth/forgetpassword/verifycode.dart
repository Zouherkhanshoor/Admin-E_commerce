import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/view/widget/auth/customtextbodyauth.dart';
import 'package:test_app/view/widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 2.5,
          title: Text("39".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.grey)),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: ListView(
            children: [
              CustomTextTitleAuth(
                text: '40'.tr,
              ),
              const SizedBox(height: 15),
              CustomTextBodyAuth(
                text: "41".tr,
              ),
              const SizedBox(height: 35),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}

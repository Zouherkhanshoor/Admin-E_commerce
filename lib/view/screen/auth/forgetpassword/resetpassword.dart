import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/view/widget/auth/custombuttonauth.dart';
import 'package:test_app/view/widget/auth/customtextbodyauth.dart';
import 'package:test_app/view/widget/auth/customtextformauth.dart';
import 'package:test_app/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 2.5,
          title: Text("Reset Password",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text: '35'.tr,
                        ),
                        const SizedBox(height: 15),
                        CustomTextBodyAuth(
                          text: "34".tr,
                        ),
                        const SizedBox(height: 35),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.lock_outlined,
                          labeltext: "19".tr,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.repassword,
                          hinttext: "re ${"42".tr}",
                          iconData: Icons.lock_outlined,
                          labeltext: "19".tr,
                        ),
                        CustomButtonAuth(
                          text: "33".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ))));
  }
}

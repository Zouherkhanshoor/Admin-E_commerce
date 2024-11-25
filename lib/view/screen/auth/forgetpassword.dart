import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/view/widget/auth/custombuttonauth.dart';
import 'package:test_app/view/widget/auth/customtextbodyauth.dart';
import 'package:test_app/view/widget/auth/customtextformauth.dart';
import 'package:test_app/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 2.5,
          title: Text("14".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                          text: '27'.tr,
                        ),
                        const SizedBox(height: 15),
                        CustomTextBodyAuth(
                          text: "29".tr,
                        ),
                        const SizedBox(height: 35),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "18".tr,
                        ),
                        CustomButtonAuth(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkemail();
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/auth/login_controller.dart';
import 'package:test_app/core/class/handlingdataview.dart';
import 'package:test_app/core/constant/color.dart';
import 'package:test_app/core/functions/alertexitapp.dart';
import 'package:test_app/core/functions/validinput.dart';
import 'package:test_app/view/widget/auth/custombuttonauth.dart';
import 'package:test_app/view/widget/auth/customtextbodyauth.dart';
import 'package:test_app/view/widget/auth/customtextformauth.dart';
import 'package:test_app/view/widget/auth/customtexttitleauth.dart';
import 'package:test_app/view/widget/auth/logoauth.dart';
import 'package:test_app/view/widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 2.5,
          title: Text("9".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColor.grey)),
        ),
        body: PopScope<Object>(
            canPop: false,
            onPopInvokedWithResult: (bool didPop, Object? result) {
              if (didPop) {
                return;
              }
              alertExitApp();
            },
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          CustomTextTitleAuth(
                            text: "10".tr,
                          ),
                          const SizedBox(height: 15),
                          CustomTextBodyAuth(
                            text: "11".tr,
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
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                              ontapicon: () {
                                controller.showpassword();
                              },
                              obscuretext: controller.isshowpassword,
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.remove_red_eye_outlined,
                              labeltext: "19".tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "14".tr,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          CustomButtonAuth(
                            text: "15".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          // const SizedBox(height: 30),
                          // CustomTextSignUpOrSignIn(
                          //   onTap: () {
                          //     controller.goToSignUp();
                          //   },
                          //   textone: "16".tr,
                          //   texttwo: "17".tr,
                          // ),
                        ],
                      ),
                    ),
                  )),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.signincolor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}

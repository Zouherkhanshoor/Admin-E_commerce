import 'package:flutter/material.dart';
import 'package:test_app/core/constant/color.dart';

class CustomButtomLang extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  const CustomButtomLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        color: AppColor.primarycolor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}

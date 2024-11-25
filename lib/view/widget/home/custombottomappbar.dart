import 'package:flutter/material.dart';
import 'package:test_app/core/constant/color.dart';

class CustomButtomAppBar extends StatelessWidget {
  final String textbutton;
  final IconData icondata;
  final void Function()? onPressed;
  final bool? active;
  const CustomButtomAppBar(
      {super.key,
      required this.onPressed,
      required this.textbutton,
      required this.icondata,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? AppColor.primarycolor : AppColor.grey2,
          ),
          Text(
            textbutton,
            style: TextStyle(
                color: active == true ? AppColor.primarycolor : AppColor.grey2),
          )
        ],
      ),
    );
  }
}

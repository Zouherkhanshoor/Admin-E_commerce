import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String url;
  final String title;
  final void Function()? onpressed;
  const CardAdminHome(
      {super.key,
      required this.url,
      required this.title,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              width: 80,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}

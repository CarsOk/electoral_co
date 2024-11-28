import 'package:flutter/material.dart';

import '../colors/custom_color.dart';

class CustomOutlinedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String content;
  final Color color;

  const CustomOutlinedButtonWidget({
    super.key,
    required this.onPressed,
    required this.content,
    this.color = CustomColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: color,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        content.toUpperCase(),
        style: TextStyle(color: color),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../colors/custom_color.dart';

class CustomCheckboxWidget extends Checkbox {
  CustomCheckboxWidget({required super.value, required super.onChanged});

  @override
  OutlinedBorder? get shape => const CircleBorder();

  @override
  Color? get activeColor => CustomColor.primary;

  @override
  BorderSide? get side =>
      const BorderSide(color: CustomColor.primary, width: 2);
}

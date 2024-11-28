import 'package:flutter/material.dart';

import '../colors/custom_color.dart';

class CustomCheckboxListTileWidget extends CheckboxListTile {
  CustomCheckboxListTileWidget({
    required super.value,
    required super.onChanged,
  });

  @override
  Color? get activeColor => CustomColor.primary;

  @override
  BorderSide? get side =>
      const BorderSide(color: CustomColor.primary, width: 2);

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
}

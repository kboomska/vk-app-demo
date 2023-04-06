import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextField {
  static inputDecoration({bool isNegative = false, String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.textFieldHint,
        fontSize: 16,
      ),
      filled: true,
      fillColor: !isNegative
          ? AppColors.textFieldFill
          : AppColors.textFieldFillNegative,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: !isNegative
              ? AppColors.textFieldBorder
              : AppColors.textFieldBorderNegative,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: !isNegative
              ? AppColors.buttonBlue
              : AppColors.textFieldBorderNegative,
        ),
      ),
    );
  }
}

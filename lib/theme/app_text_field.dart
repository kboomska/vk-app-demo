import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextField {
  static inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.textFieldBorder,
        fontSize: 16,
      ),
      filled: true,
      fillColor: AppColors.textFieldFill,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.textFieldBorder,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.buttonBlue,
        ),
      ),
    );
  }
}

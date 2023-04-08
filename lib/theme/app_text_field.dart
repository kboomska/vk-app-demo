import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextField {
  static inputDecoration({bool isError = false, String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.textFieldHint,
        fontSize: 16,
      ),
      filled: true,
      fillColor: !isError
          ? AppColors.textFieldEnabledFill
          : AppColors.textFieldErrorFill,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: !isError
              ? AppColors.textFieldEnabledBorder
              : AppColors.textFieldErrorBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: !isError
              ? AppColors.textFieldFocusedBorder
              : AppColors.textFieldErrorBorder,
        ),
      ),
      isCollapsed: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.5,
        vertical: 12.5,
      ),
    );
  }

  static decoration({
    String? hintText,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.textFieldHint,
        fontSize: 16,
      ),
      filled: true,
      fillColor: errorText == null
          ? AppColors.textFieldEnabledFill
          : AppColors.textFieldErrorFill,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.textFieldEnabledBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.textFieldFocusedBorder,
        ),
      ),
      errorText: errorText,
      errorMaxLines: 2,
      errorStyle: const TextStyle(
        fontSize: 14,
        color: AppColors.textFieldErrorText,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.textFieldErrorBorder,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.textFieldErrorBorder,
        ),
      ),
      isCollapsed: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.5,
        vertical: 12.5,
      ),
    );
  }
}

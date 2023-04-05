import 'package:flutter/material.dart';

import '/theme/app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle blueStyleButton = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(
      AppColors.buttonBlue,
    ),
    foregroundColor: const MaterialStatePropertyAll(
      Colors.white,
    ),
    overlayColor: const MaterialStatePropertyAll(
      AppColors.buttonPressed,
    ),
    splashFactory: NoSplash.splashFactory,
    minimumSize: const MaterialStatePropertyAll(
      Size.fromHeight(44),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    side: const MaterialStatePropertyAll(BorderSide.none),
  );

  static final ButtonStyle greenStyleButton = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(
      AppColors.buttonGreen,
    ),
    foregroundColor: const MaterialStatePropertyAll(
      Colors.white,
    ),
    overlayColor: const MaterialStatePropertyAll(
      AppColors.buttonPressed,
    ),
    splashFactory: NoSplash.splashFactory,
    minimumSize: const MaterialStatePropertyAll(
      Size.fromHeight(44),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    side: const MaterialStatePropertyAll(BorderSide.none),
  );
}

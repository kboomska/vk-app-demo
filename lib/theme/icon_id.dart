import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class IconID {
  static Widget small = ConstrainedBox(
    constraints: BoxConstraints.loose(const Size(45, 20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: AppColors.logoBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
            child: Text(
              'VK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        const Text(
          'ID',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

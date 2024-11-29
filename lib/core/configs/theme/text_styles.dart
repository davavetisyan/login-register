import 'package:flutter/material.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle headlineTextStyle = const TextStyle(
    color: AppColors.headlineTextColor,
    fontWeight: FontWeight.w700,
    fontFamily: "Assistant",
  );

  static TextStyle regularTextStyle = const TextStyle(
    color: AppColors.headlineTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: "Assistant",
  );
  static TextStyle errorTextStyle = const TextStyle(
    color: AppColors.errorColor,
    fontWeight: FontWeight.w400,
    fontFamily: "Assistant",
  );
}

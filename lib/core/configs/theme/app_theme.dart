import 'package:flutter/material.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/core/configs/theme/text_styles.dart';

class AppTheme {
  static ThemeData get standart {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.mainBgColor,
      textTheme: _textTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
        displayMedium: AppTextStyle.regularTextStyle,
        headlineLarge: AppTextStyle.headlineTextStyle,
        labelMedium: AppTextStyle.errorTextStyle);
  }
}

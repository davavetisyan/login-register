import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../configs/theme/app_colors.dart';

class FormItem extends StatelessWidget {
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String hintText;
  final bool obscureText;
  final Map<String, String Function(Object)>? validationMessage;
  final String formControlName;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(FormControl<dynamic>)? onTap;
  final EdgeInsets? contentPadding;
  const FormItem(
      {super.key,
      this.validationMessage,
      this.keyboardType,
      this.prefixIcon,
      required this.formControlName,
      required this.hintText,
      this.maxLength,
      this.obscureText = false,
      this.readOnly = false,
      this.controller,
      this.onTap,
      this.inputFormatters,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      cursorHeight: 20,
      cursorOpacityAnimates: true,
      controller: controller,
      readOnly: readOnly,
      maxLength: maxLength,

      //formControl: formControl,
      formControlName: formControlName,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      validationMessages: validationMessage,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.headlineTextColor, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorStyle:
            Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.headlineTextColor, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: prefixIcon,
        hintStyle:
            Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16),
        hintText: hintText,
      ),
    );
  }
}

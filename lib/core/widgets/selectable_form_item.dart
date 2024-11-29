import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../configs/theme/app_colors.dart';

class SelectableFormItem extends StatelessWidget {
  const SelectableFormItem(
      {super.key,
      required this.hintText,
      required this.formControlName,
      required this.items,
      this.validationMessages});

  final String hintText;
  final String formControlName;
  final List<String> items;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<String>(
      decoration: InputDecoration(
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
        hintStyle:
            Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16),
        hintText: hintText,
      ),
      validationMessages: validationMessages,
      hint: Text(hintText),
      formControlName: formControlName,
      items: items
          .map(
            (code) => DropdownMenuItem(
              value: code,
              child: Text(
                code,
              ),
            ),
          )
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../configs/theme/app_colors.dart';

class PhoneFormItem extends StatelessWidget {
  const PhoneFormItem(
      {super.key,
      required this.countryCodes,
      required this.countryCodeFormControlName,
      required this.phoneformControlName});

  final List<String> countryCodes;
  final String countryCodeFormControlName;
  final String phoneformControlName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: ReactiveDropdownField<String>(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.headlineTextColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              errorStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontSize: 16),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.headlineTextColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              hintStyle: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16),
              hintText: 'Select Code'.tr,
            ),
            validationMessages: {
              'required': (_) => 'Phone number is required'.tr,
            },
            hint:  Text('Select Code'.tr),
            formControlName: countryCodeFormControlName,
            items: countryCodes
                .map(
                  (code) => DropdownMenuItem(
                    value: code,
                    child: Text(
                      code,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ReactiveTextField(
            formControlName: phoneformControlName,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.headlineTextColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              errorStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontSize: 16),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.headlineTextColor, width: 0.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              hintStyle: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
              hintText: 'Phone Number'.tr,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/core/widgets/form_item.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:login_register/core/widgets/phone_form_item.dart';
import 'package:login_register/core/widgets/selectable_form_item.dart';
import 'package:login_register/features/sing_up/sing_up_controller.dart';
import 'package:login_register/route/routes.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/configs/theme/app_colors.dart';

class SignUpAsTeacher extends StatelessWidget {
  const SignUpAsTeacher({
    super.key,
    required SingUpController singUpController,
  }) : _singUpController = singUpController;

  final SingUpController _singUpController;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _singUpController.signUpFormGroopAsTeacher,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormItem(
                  validationMessage: {
                    'required': (_) => 'Name is required'.tr,
                  },
                  contentPadding:
                      const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                  formControlName: _singUpController.nameKey,
                  hintText: 'Name'.tr,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FormItem(
                  validationMessage: {
                    'required': (_) => 'Last Name is required'.tr,
                  },
                  contentPadding:
                      const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                  formControlName: _singUpController.lastNameKey,
                  hintText: 'Last Name'.tr,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FormItem(
              validationMessage: {
                'required': (_) => 'Email is required'.tr,
              },
              contentPadding:
                  const EdgeInsets.only(left: 16, top: 12, bottom: 12),
              formControlName: _singUpController.emailKey,
              hintText: 'Email'.tr,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PhoneFormItem(
              countryCodes: const ['+374', '+375', '+376', '+377'],
              countryCodeFormControlName: _singUpController.countryPhoneCode,
              phoneformControlName: _singUpController.phoneCode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'Region',
              formControlName: _singUpController.regionCode,
              items: const ['Armenia', 'Russia', 'Argentina'],
              validationMessages: {
                'required': (_) => 'Region, Village is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'City, Village',
              formControlName: _singUpController.cityVillage,
              items: const ['Armenia', 'Russia', 'Argentina'],
              validationMessages: {
                'required': (_) => 'City, Village is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'School',
              formControlName: _singUpController.scoolCode,
              items: const ['Hello', 'Hello1', 'Hello2'],
              validationMessages: {
                'required': (_) => 'School is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'City',
              formControlName: _singUpController.cityCode,
              items: const ['City1', 'city2', 'city3'],
              validationMessages: {
                'required': (_) => 'City is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'Subject',
              formControlName: _singUpController.subjectCode,
              items: const ['City1', 'city2', 'city3'],
              validationMessages: {
                'required': (_) => 'Subject is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectableFormItem(
              hintText: 'Grade',
              formControlName: _singUpController.grade,
              items: const ['City1', 'city2', 'city3'],
              validationMessages: {
                'required': (_) => 'Grade is required'.tr,
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: [
                FormItem(
                  formControlName: _singUpController.passwordKey,
                  validationMessage: {
                    'required': (_) =>
                        'Must have at least ${_singUpController.passwordLength} symbols',
                    'minLength': (_) =>
                        'Must have at least ${_singUpController.passwordLength} symbols',
                  },
                  hintText: 'Password'.tr,
                  obscureText: true,
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: SvgPicture.asset(AppAssets.eye),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: [
                FormItem(
                  formControlName: _singUpController.confirmPasswordKey,
                  validationMessage: {
                    'required': (_) =>
                        'Must have at least ${_singUpController.passwordLength} symbols',
                    'minLength': (_) =>
                        'Must have at least ${_singUpController.passwordLength} symbols',
                  },
                  hintText: 'Confirm Password'.tr,
                  obscureText: true,
                ),
                Positioned(
                  top: 10,
                  right: 5,
                  child: SvgPicture.asset(AppAssets.eye),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPassowrd);
                },
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 44),
                width: double.infinity,
                child: LoadingButton(
                  callBack: _singUpController.onPressSignOkAsTeacher,
                  textStyle:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                  buttonText: 'Ok'.tr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: InkWell(
                  onTap: () {
                    Get.offAndToNamed(AppRoutes.signUp,
                        arguments: AppRoles.donor);
                  },
                  child: Text(
                    'Register as a Donor'.tr,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          decorationColor: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

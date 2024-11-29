import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/core/widgets/form_item.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:login_register/features/forgot_password/forgot_password_controller.dart';
import 'package:login_register/route/routes.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RecoverPasswordStep extends StatefulWidget {
  const RecoverPasswordStep({super.key});

  @override
  State<RecoverPasswordStep> createState() => _RecoverPasswordStepState();
}

class _RecoverPasswordStepState extends State<RecoverPasswordStep> {
  late final ForgotPasswordController _forgotPasswordController;
  @override
  void initState() {
    _forgotPasswordController = Get.find<ForgotPasswordController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Recover Password'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Please enter your email to receive a recovery code'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16),
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: ReactiveForm(
              formGroup: _forgotPasswordController.recoveryPasswordFormGroup,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormItem(
                    validationMessage: {
                      'required': (_) => 'Recovery code is required'.tr,
                    },
                    contentPadding:
                        const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                    formControlName: _forgotPasswordController.emailKey,
                    hintText: 'Recovery code'.tr,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InkWell(
                        child: Text(
                          'Resend code'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Divider(
                      color: AppColors.dividerColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(
                      children: [
                        FormItem(
                          formControlName:
                              _forgotPasswordController.passwordKey,
                          validationMessage: {
                            'required': (_) =>
                                'Must have at least ${_forgotPasswordController.passwordLength} symbols',
                            'minLength': (_) =>
                                'Must have at least ${_forgotPasswordController.passwordLength} symbols',
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
                          formControlName:
                              _forgotPasswordController.passwordKey,
                          validationMessage: {
                            'required': (_) =>
                                'Must have at least ${_forgotPasswordController.passwordLength} symbols',
                            'minLength': (_) =>
                                'Must have at least ${_forgotPasswordController.passwordLength} symbols',
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
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    width: double.infinity,
                    child: LoadingButton(
                      callBack: _forgotPasswordController.onPressDone,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                      buttonText: 'Done'.tr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.signIn);
                      },
                      child: Text(
                        'I remember my password'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: AppColors.headlineTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

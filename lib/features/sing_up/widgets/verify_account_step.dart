import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/core/widgets/form_item.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:login_register/features/sing_up/sing_up_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class VerifyAccountStep extends StatelessWidget {
  const VerifyAccountStep({
    super.key,
    required SingUpController singUpController,
  }) : _singUpController = singUpController;

  final SingUpController _singUpController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Verify Account'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Please check your email and enter the recovery code'.tr,
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
              formGroup: _singUpController.verifyCodeFormGroup,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormItem(
                    validationMessage: {
                      'required': (_) => 'Code is required'.tr,
                    },
                    contentPadding:
                        const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                    formControlName: _singUpController.verifyCode,
                    hintText: 'Code'.tr,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 450),
                    width: double.infinity,
                    child: LoadingButton(
                      callBack: _singUpController.verifyOk,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                      buttonText: 'Send'.tr,
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

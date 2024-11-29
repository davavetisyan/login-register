import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/core/widgets/form_item.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../forgot_password_controller.dart';

class SendEmailStep extends StatefulWidget {
  const SendEmailStep({super.key});

  @override
  State<SendEmailStep> createState() => _SendEmailStepState();
}

class _SendEmailStepState extends State<SendEmailStep> {
  late final ForgotPasswordController _forgotPasswordController;
  @override
  void initState() {
    _forgotPasswordController = Get.find<ForgotPasswordController>();
    super.initState();
  }

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
              formGroup: _forgotPasswordController.forgotPasswordEmailFormGroup,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormItem(
                    validationMessage: {
                      'required': (_) => 'Email is required'.tr,
                    },
                    contentPadding:
                        const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                    formControlName: _forgotPasswordController.emailKey,
                    hintText: 'Email'.tr,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 450),
                    width: double.infinity,
                    child: LoadingButton(
                      
                      callBack: _forgotPasswordController.onPressSendEmail,
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

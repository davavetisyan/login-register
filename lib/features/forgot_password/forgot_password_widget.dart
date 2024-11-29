import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:login_register/features/forgot_password/forgot_password_controller.dart';
import 'package:login_register/features/forgot_password/widgets/send_email_step.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/configs/theme/app_colors.dart';
import '../../core/widgets/form_item.dart';
import 'widgets/recover_password_stpe.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late final ForgotPasswordController _forgotPasswordController;
  @override
  void initState() {
    _forgotPasswordController = Get.find<ForgotPasswordController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _forgotPasswordController.currentStep.value == 1
        ? TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(opacity: value, child: const SendEmailStep());
            },
          )
        : TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(opacity: value, child: const RecoverPasswordStep());
            },
          ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/features/sing_up/sing_up_controller.dart';
import 'package:login_register/features/sing_up/widgets/sign_up_as_donor.dart';
import 'package:login_register/features/sing_up/widgets/sign_up_as_teacher.dart';

class SingUpStep extends StatelessWidget {
  const SingUpStep({
    super.key,
    required this.role,
    required SingUpController singUpController,
  }) : _singUpController = singUpController;

  final AppRoles role;
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
              'Sign Up'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'It’s quick and easy.'.tr,
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
            child: role == AppRoles.donor
                ? SignUpAsDonor(singUpController: _singUpController)
                : SignUpAsTeacher(singUpController: _singUpController),
          ),
        ],
      ),
    );
  }
}

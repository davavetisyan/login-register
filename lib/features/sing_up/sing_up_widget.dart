import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/features/sing_up/sing_up_controller.dart';
import 'package:login_register/features/sing_up/widgets/sign_up_step.dart';
import 'package:login_register/features/sing_up/widgets/verify_account_step.dart';

class SingUpWidget extends StatefulWidget {
  const SingUpWidget({super.key, required this.role});

  final AppRoles role;

  @override
  State<SingUpWidget> createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  late final SingUpController _singUpController;
  @override
  void initState() {
    if (Get.isRegistered<SingUpController>()) {
      _singUpController = Get.find<SingUpController>();
    } else {
      _singUpController = Get.put<SingUpController>(
          SingUpController(selectedRole: widget.role));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _singUpController.currentStep.value == 1
        ? TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                  opacity: value,
                  child: SingUpStep(
                    role: widget.role,
                    singUpController: _singUpController,
                  ));
            },
          )
        : TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                  opacity: value,
                  child: VerifyAccountStep(
                    singUpController: _singUpController,
                  ));
            },
          ));
  }
}

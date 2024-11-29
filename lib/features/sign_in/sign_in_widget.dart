import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/core/widgets/loading_button.dart';
import 'package:login_register/features/sign_in/sign_in_controller.dart';
import 'package:login_register/route/routes.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/models/enums.dart';
import '../../core/widgets/form_item.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late final SignInController _signInController;
  @override
  void initState() {
    if (Get.isRegistered<SignInController>()) {
      _signInController = Get.find<SignInController>();
    } else {
      _signInController = Get.put<SignInController>(SignInController());
    }
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
              'Sign In'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Welcome back!'.tr,
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
              formGroup: _signInController.signInFormGroup,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormItem(
                    validationMessage: {
                      'required': (_) => 'Email is required'.tr,
                    },
                    contentPadding:
                        const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                    formControlName: _signInController.emailKey,
                    hintText: 'Email'.tr,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(
                      children: [
                        FormItem(
                          formControlName: _signInController.passwordKey,
                          validationMessage: {
                            'required': (_) =>
                                'Must have at least ${_signInController.passwordLength} symbols',
                            'minLength': (_) =>
                                'Must have at least ${_signInController.passwordLength} symbols',
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
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPassowrd);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    width: double.infinity,
                    child: LoadingButton(
                      callBack: _signInController.onPressSignIn,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                      buttonText: 'Sign In'.tr,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Divider(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 200,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Register as a'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.signUp,
                                arguments: AppRoles.teacher);
                          },
                          child: Text(
                            'Teacher'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.signUp,
                                arguments: AppRoles.donor);
                          },
                          child: Text(
                            'Donor'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

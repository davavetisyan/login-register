import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/service_locator.dart';

import '../../route/routes.dart';
import '../shared_prefs.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var user = locator<SharedPrefs>().getString(StorageKeys.userStorageKey);

    bool isLogedIn = user != null;

    return Container(
      width: double.infinity,
      height: 400,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 4,
              width: 30,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const BottomSheetItem(text: 'Home'),
            const SizedBox(
              height: 8,
            ),
            const BottomSheetItem(text: 'Teachers'),
            const SizedBox(
              height: 8,
            ),
            const BottomSheetItem(text: 'Donors'),
            const SizedBox(
              height: 8,
            ),
            const BottomSheetItem(text: 'About us'),
            const SizedBox(
              height: 8,
            ),
            const BottomSheetItem(text: 'Contact us'),
            const SizedBox(
              height: 8,
            ),
            const BottomSheetItem(text: 'Blog'),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text(
                      'Eng',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Text(
                      'հայ',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Text(
                      'Рус',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: InkWell(
                      onTap: () async {
                        if (isLogedIn) {
                          await locator<SharedPrefs>()
                              .remove(StorageKeys.userStorageKey);
                        }
                        Get.offAllNamed(AppRoutes.signIn);
                      },
                      child: Row(children: [
                        SvgPicture.asset(
                          AppAssets.logout,
                          color: AppColors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          isLogedIn ? 'Logout' : 'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: AppColors.primaryColor,
        )
      ],
    );
  }
}

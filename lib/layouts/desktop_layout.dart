import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/shared_prefs.dart';
import 'package:login_register/route/routes.dart';
import 'package:login_register/service_locator.dart';

import '../core/configs/constants/app_assets.dart';
import '../core/configs/theme/app_colors.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var user = locator<SharedPrefs>().getString(StorageKeys.userStorageKey);

    bool isLogedIn = user != null;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: AppColors.primaryColor,
        actions: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 120,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          SvgPicture.asset(AppAssets.desktopLogo),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Teacher'.tr.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          color: AppColors.mainBgColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    color: AppColors.mainBgColor,
                                    height: 2,
                                    width: 58,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              Text(
                                'Donors'.tr.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: AppColors.mainBgColor
                                            .withOpacity(0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              Text(
                                'About us'.tr.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: AppColors.mainBgColor
                                            .withOpacity(0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              Text(
                                'Contact us'.tr.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: AppColors.mainBgColor
                                          .withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(
                                width: 48,
                              ),
                              Text(
                                'blog'.tr.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: AppColors.mainBgColor
                                          .withOpacity(0.6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                              )
                            ],
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Text(
                              'Eng',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: AppColors.mainBgColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              'հայ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color:
                                        AppColors.mainBgColor.withOpacity(0.6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              'Рус',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color:
                                        AppColors.mainBgColor.withOpacity(0.6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 120,
                  child: InkWell(
                    onTap: () async {
                      if (isLogedIn) {
                        await locator<SharedPrefs>()
                            .remove(StorageKeys.userStorageKey);
                      }
                      Get.offAllNamed(AppRoutes.signIn);
                    },
                    child: Row(children: [
                      SvgPicture.asset(AppAssets.logout),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        isLogedIn ? 'Logout' : 'Sign in',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: AppColors.mainBgColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 432,
            height: 780,
            padding: const EdgeInsets.only(top: 48, bottom: 40),
            child: Card(
              elevation: 5,
              color: AppColors.mainBgColor,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

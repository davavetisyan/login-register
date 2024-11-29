import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';
import 'package:login_register/route/routes.dart';
import 'package:login_register/service_locator.dart';

import '../../core/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var user = locator<SharedPrefs>().getString(StorageKeys.userStorageKey);

    if (user != null) {
      Future.delayed(const Duration(seconds: 1))
          .then((value) => Get.offAllNamed(AppRoutes.home));
    } else {
      Future.delayed(const Duration(seconds: 1))
          .then((value) => Get.offAllNamed(AppRoutes.signIn));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('splash');
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(AppAssets.desktopLogo),
      ),
    );
  }
}

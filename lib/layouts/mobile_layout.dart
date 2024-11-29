import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/sheets/custom_bottom_sheet.dart';

import '../core/configs/theme/app_colors.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          backgroundColor: AppColors.primaryColor,
          actions: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,
                    child: SvgPicture.asset(AppAssets.logo),
                  ),
                  Positioned(
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(const CustomBottomSheet());
                      },
                      child: SvgPicture.asset(AppAssets.mobileDrawer),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: child,
      ),
    );
  }
}

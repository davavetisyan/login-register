import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/sheets/custom_bottom_sheet.dart';

import '../core/configs/theme/app_colors.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        actions: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 80,
                  child: SvgPicture.asset(AppAssets.desktopLogo),
                ),
                Positioned(
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(const CustomBottomSheet());
                    },
                    child: SvgPicture.asset(AppAssets.tabletDrawer),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 432,
          height: 780,
          padding: const EdgeInsets.only(top: 45),
          child: Card(
            elevation: 3,
            color: AppColors.mainBgColor,
            child: child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/app_assets.dart';
import 'package:login_register/core/configs/theme/app_colors.dart';

class SomethinWentWrongDialog extends StatelessWidget {
  const SomethinWentWrongDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(children: [
        Container(
          height: 382,
          width: 382,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned.fill(child: SvgPicture.asset(AppAssets.wrong)),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Something Went Wrong',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16, color: AppColors.errorColor),
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(AppAssets.close),
          ),
        )
      ]),
    );
  }
}

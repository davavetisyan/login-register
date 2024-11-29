import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/theme/app_colors.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    this.callBack,
    required this.textStyle,
    required this.buttonText,
    this.buttonStyle,
  });

  final Future Function()? callBack;
  final TextStyle? textStyle;
  final String buttonText;
  final ButtonStyle? buttonStyle;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      onPressed: widget.callBack == null
          ? null
          : () {
              if (loading.value == false) {
                loading.value = true;
                widget.callBack!().then((value) => loading.value = false);
              }
            },
      child: Obx(
        () => !loading.value
            ? Text(
                widget.buttonText,
                style: widget.textStyle,
              )
            : const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

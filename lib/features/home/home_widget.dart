import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/shared_prefs.dart';
import 'package:login_register/service_locator.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Welcome '.tr,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      Text(
        locator<SharedPrefs>().getString(StorageKeys.userStorageKey) ?? 'none',
      )
    ]);
  }
}

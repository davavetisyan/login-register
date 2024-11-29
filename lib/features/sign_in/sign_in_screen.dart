import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_register/features/sign_in/sign_in_widget.dart';
import 'package:login_register/layouts/desktop_layout.dart';
import 'package:login_register/layouts/mobile_layout.dart';
import 'package:login_register/layouts/responsive_layout.dart';
import 'package:login_register/layouts/tablet_layout.dart';

import 'sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final SignInController _signInController;
  @override
  void initState() {
    _signInController = Get.put<SignInController>(
      SignInController(),
    );
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SignInController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileLayout(
        child: SingleChildScrollView(
          child: SignInWidget(),
        ),
      ),
      tabletBody: TabletLayout(
        child: SingleChildScrollView(child: SignInWidget()),
      ),
      desktopBody: DesktopLayout(
        child: SignInWidget(),
      ),
    );
  }
}

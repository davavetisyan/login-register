import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_register/features/forgot_password/forgot_password_controller.dart';

import '../../layouts/desktop_layout.dart';
import '../../layouts/mobile_layout.dart';
import '../../layouts/responsive_layout.dart';
import '../../layouts/tablet_layout.dart';
import 'forgot_password_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final ForgotPasswordController _forgotPasswordController;
  @override
  void initState() {
    _forgotPasswordController = Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
    );
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ForgotPasswordController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileLayout(
        child: SingleChildScrollView(
          child: ForgotPasswordWidget(),
        ),
      ),
      tabletBody: TabletLayout(
        child: SingleChildScrollView(child: ForgotPasswordWidget()),
      ),
      desktopBody: DesktopLayout(
        child: ForgotPasswordWidget(),
      ),
    );
  }
}

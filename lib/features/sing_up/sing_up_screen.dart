import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/features/sign_in/sign_in_widget.dart';
import 'package:login_register/layouts/desktop_layout.dart';
import 'package:login_register/layouts/mobile_layout.dart';
import 'package:login_register/layouts/responsive_layout.dart';
import 'package:login_register/layouts/tablet_layout.dart';

import 'sing_up_controller.dart';
import 'sing_up_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.role});

  final AppRoles role;

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  late final SingUpController _singUpController;
  @override
  void initState() {
    _singUpController = Get.put<SingUpController>(
      SingUpController(selectedRole: widget.role),
    );

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SingUpController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileLayout(
        child: SingleChildScrollView(
          child: SingUpWidget(
            role: widget.role,
          ),
        ),
      ),
      tabletBody: TabletLayout(
        child: SingleChildScrollView(
          child: SingUpWidget(
            role: widget.role,
          ),
        ),
      ),
      desktopBody: DesktopLayout(
        child: SingleChildScrollView(
          child: SingUpWidget(
            role: widget.role,
          ),
        ),
      ),
    );
  }
}

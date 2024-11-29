import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_register/features/home/home_widget.dart';
import 'package:login_register/features/sign_in/sign_in_widget.dart';
import 'package:login_register/layouts/desktop_layout.dart';
import 'package:login_register/layouts/mobile_layout.dart';
import 'package:login_register/layouts/responsive_layout.dart';
import 'package:login_register/layouts/tablet_layout.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileLayout(
        child: SingleChildScrollView(
          child: HomeWidget(),
        ),
      ),
      tabletBody: TabletLayout(
        child: HomeWidget(),
      ),
      desktopBody: DesktopLayout(
        child: HomeWidget(),
      ),
    );
  }
}

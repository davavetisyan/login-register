import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/core/shared_prefs.dart';
import 'package:login_register/features/home/home_screen.dart';
import 'package:login_register/features/sign_in/sign_in_screen.dart';
import 'package:login_register/features/sing_up/sing_up_screen.dart';
import 'package:login_register/features/splash/splash_screen.dart';
import 'package:login_register/route/routes.dart';
import 'package:login_register/service_locator.dart';

import '../features/forgot_password/forgot_password_screen.dart';

class AppNavigation {
  static final AppNavigation _singleton = AppNavigation._internal();
  static final GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  factory AppNavigation() {
    return _singleton;
  }

  AppNavigation._internal();

  Route? generateRoute(RouteSettings settings) {
    var user = locator<SharedPrefs>().getString(StorageKeys.userStorageKey);
    bool isLogedIn = user != null;
    if (isLogedIn) {
      return pageRouteBuilder(
        settings: settings,
        page: const HomeScreen(),
      );
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return pageRouteBuilder(
          page: const SplashScreen(),
        );
      case AppRoutes.signIn:
        return pageRouteBuilder(
          settings: settings,
          page: const SignInScreen(),
        );

      case AppRoutes.forgotPassowrd:
        return pageRouteBuilder(
          settings: settings,
          page: const ForgotPasswordScreen(),
        );

      case AppRoutes.home:
        return pageRouteBuilder(
          settings: settings,
          page: const HomeScreen(),
        );

      case AppRoutes.signUp:
        AppRoles role = AppRoles.donor;
        if (settings.arguments != null) {
          role = settings.arguments as AppRoles;
        }

        return pageRouteBuilder(
          settings: settings,
          page: SingUpScreen(role: role),
        );
      default:
        return pageRouteBuilder(
          page: const SplashScreen(),
        );
    }
  }

  PageRouteBuilder pageRouteBuilder({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      settings: settings,
    );
  }
}

import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/popups/somethin_went_wrong.dart';
import 'package:login_register/core/shared_prefs.dart';
import 'package:login_register/route/routes.dart';
import 'package:login_register/service_locator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInController extends GetxController {
  final String emailKey = 'email';
  final String passwordKey = 'password';
  final int passwordLength = 4;
  late FormGroup signInFormGroup;

  @override
  void onInit() {
    signInFormGroup = FormGroup(
      {
        emailKey: FormControl<String>(
          validators: [
            Validators.email,
          ],
        ),
        passwordKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(passwordLength),
          ],
        ),
      },
    );

    super.onInit();
  }

  Future<void> onPressSignIn() async {
    await Future.delayed(const Duration(seconds: 1));
    signInFormGroup.unfocus();
    if (signInFormGroup.valid) {
      var passowrd = locator<SharedPrefs>().getString(
        StorageKeys.passwordKey,
      );
      var email = locator<SharedPrefs>().getString(
        StorageKeys.email,
      );

      if (passowrd != null && email != null) {
        if (passowrd == signInFormGroup.rawValue[passwordKey].toString() &&
            email == signInFormGroup.rawValue[emailKey].toString()) {
          Get.offAllNamed(AppRoutes.home);
        }
      } else {
        Get.dialog(const SomethinWentWrongDialog(), barrierDismissible: false);
      }
    } else {
      signInFormGroup.markAllAsTouched();
    }
  }
}

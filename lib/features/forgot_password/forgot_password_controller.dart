import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordController extends GetxController {
  final String emailKey = 'email';
  final String passwordKey = 'password';
  final String confirmPassowrd = 'oldPassword';
  final String recoveryCode = 'recoveryCode';
  final int passwordLength = 4;
  late FormGroup forgotPasswordEmailFormGroup;
  late FormGroup recoveryPasswordFormGroup;

  RxInt currentStep = 1.obs;

  @override
  void onInit() {
    forgotPasswordEmailFormGroup = FormGroup(
      {
        emailKey: FormControl<String>(
          validators: [
            Validators.email,
          ],
        ),
      },
    );

    recoveryPasswordFormGroup = FormGroup(
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
        confirmPassowrd: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(passwordLength),
          ],
        ),
      },
    );

    super.onInit();
  }

  Future<void> onPressSendEmail() async {
    ++currentStep.value;
    forgotPasswordEmailFormGroup.unfocus();
    if (forgotPasswordEmailFormGroup.valid) {
    } else {
      forgotPasswordEmailFormGroup.markAllAsTouched();
    }
  }

    Future<void> onPressDone() async {

    recoveryPasswordFormGroup.unfocus();
    if (recoveryPasswordFormGroup.valid) {
    } else {
      recoveryPasswordFormGroup.markAllAsTouched();
    }
  }
}

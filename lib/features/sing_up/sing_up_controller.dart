import 'package:get/get.dart';
import 'package:login_register/core/configs/constants/storage_keys.dart';
import 'package:login_register/core/models/enums.dart';
import 'package:login_register/core/shared_prefs.dart';
import 'package:login_register/route/routes.dart';
import 'package:login_register/service_locator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SingUpController extends GetxController {
  final String emailKey = 'email';
  final String passwordKey = 'password';
  final String confirmPasswordKey = 'confirmPassowrd';
  final String nameKey = 'name';
  final String lastNameKey = 'lastName';
  final String countryPhoneCode = 'phoneCode';
  final String phoneCode = 'phone';
  final String countryFormCode = 'country';
  final String regionStatCode = 'regionState';
  final String cityCode = 'city';

  final String cityVillage = 'City, Village';
  final String scoolCode = 'School';
  final String regionCode = 'Region';
  final String subjectCode = 'Subject';
  final String grade = 'Grade';

  final String verifyCode = 'codeVerify';

  final int passwordLength = 4;
  late FormGroup signUpFormGroopAsDonor;
  late FormGroup signUpFormGroopAsTeacher;
  late FormGroup verifyCodeFormGroup;
  late AppRoles selectedRole;
  late RxInt currentStep = 1.obs;

  SingUpController({required this.selectedRole});

  @override
  void onInit() {
    signUpFormGroopAsDonor = FormGroup(
      {
        cityCode: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        regionStatCode: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        countryFormCode: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        lastNameKey: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        nameKey: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        emailKey: FormControl<String>(
          validators: [
            Validators.email,
          ],
        ),
        countryPhoneCode: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        phoneCode: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
          ],
        ),
        passwordKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(passwordLength),
          ],
        ),
        confirmPasswordKey: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(passwordLength),
          ],
        ),
      },
    );

    signUpFormGroopAsTeacher = FormGroup({
      grade: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      scoolCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      cityCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      regionCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      subjectCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      cityVillage: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      lastNameKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      nameKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      emailKey: FormControl<String>(
        validators: [
          Validators.email,
        ],
      ),
      countryPhoneCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      phoneCode: FormControl<String>(
        validators: [
          Validators.required,
          Validators.number(),
        ],
      ),
      passwordKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(passwordLength),
        ],
      ),
      confirmPasswordKey: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(passwordLength),
        ],
      ),
    }, validators: [
      Validators.mustMatch(confirmPasswordKey, passwordKey),
    ]);

    verifyCodeFormGroup = FormGroup({
      verifyCode: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });

    super.onInit();
  }

  Future<void> onPressSignOkAsDonor() async {
    await Future.delayed(const Duration(seconds: 1));
    signUpFormGroopAsDonor.unfocus();
    if (signUpFormGroopAsDonor.valid) {
      ++currentStep.value;
    } else {
      signUpFormGroopAsDonor.markAllAsTouched();
    }
  }

  Future<void> onPressSignOkAsTeacher() async {
    await Future.delayed(const Duration(seconds: 1));
    signUpFormGroopAsTeacher.unfocus();
    if (signUpFormGroopAsTeacher.valid) {
      ++currentStep.value;
    } else {
      signUpFormGroopAsTeacher.markAllAsTouched();
    }
  }

  Future<void> verifyOk() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    verifyCodeFormGroup.unfocus();
    if (verifyCodeFormGroup.valid) {
      locator<SharedPrefs>().setString(
          StorageKeys.userName,
          signUpFormGroopAsTeacher.rawValue[nameKey].toString() +
              signUpFormGroopAsTeacher.rawValue[lastNameKey].toString());
      locator<SharedPrefs>().setString(
          StorageKeys.userStorageKey,
          signUpFormGroopAsTeacher.rawValue[nameKey].toString() +
              signUpFormGroopAsTeacher.rawValue[lastNameKey].toString());

      locator<SharedPrefs>().setString(StorageKeys.email,
          signUpFormGroopAsTeacher.rawValue[emailKey].toString());

      Get.offAllNamed(AppRoutes.home);
    } else {
      verifyCodeFormGroup.markAllAsTouched();
    }
  }
}

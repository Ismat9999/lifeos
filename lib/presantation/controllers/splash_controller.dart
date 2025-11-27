
import 'package:get/get.dart';
import 'package:lifeosai/presantation/pages/sign_in_page.dart';
import 'package:lifeosai/presantation/pages/sign_up_page.dart';

class SplashController extends GetxController {

  callSignInPage() {
    Get.off(SignInPage());
    // if (AuthService.isLoggedIn()) {
    //   Get.off(HomePage());
    // } else {
    //   Get.off(SignInPage());
  }
  callSignUpPage() {
    Get.off(SignUpPage());
    // if (AuthService.isLoggedIn()) {
    //   Get.off(HomePage());
    // } else {
    //   Get.off(SignInPage());
  }

}
